//
//  ContentView.swift
//  iTravel
//
//  Created by Elfana Anamta Chatya on 09/04/24.
//

import SwiftUI

struct ContentView: View {
    @State var alert: Bool = false
    @State var guideFlag: Bool = false
    @State var infoFlag: Bool = false
    @GestureState private var dragState = DragState.inactive
    private var dragAreaThreshold: CGFloat = 65.0
    @State private var lastCardIndex: Int = 1
    @State private var cardRemovalTransition = AnyTransition.traillingBottom

    @State var cardViews: [CardView] = {
        var views = [CardView]()
        for index in 0..<2  {
            views.append(CardView(travel: travelData[index]))
        }
        return views
    }()
    
    private func moveCards() {
        cardViews.removeFirst()
        
        self.lastCardIndex += 1
        
        let travel = travelData[lastCardIndex % travelData.count]
        let newCardView = CardView(travel: travel)
        cardViews.append(newCardView)
    }
    
    private func isTopCard(cardView: CardView)-> Bool {
        guard let index = cardViews.firstIndex(where: { $0.id == cardView.id }) else {
            return false
        }
        return index == 0
    }
    
    enum DragState {
        case inactive
        case pressing
        case dragging(translation: CGSize)
        
        var translation: CGSize {
            switch self {
            case .inactive, .pressing:
                return .zero
            case .dragging(let translation):
                return translation
            }
        }
        
        var isDragging: Bool {
            switch self {
            case .dragging:
                return true
            case .pressing, .inactive:
                return false
            }
        }
        
        var isPressing: Bool {
            switch self {
            case .pressing, .dragging:
                return true
            case .inactive:
                return false
            }
        }
    }
    
    var body: some View {
        VStack {
            // MARK: - HEADER
            HeaderView(showGuideView: $guideFlag, showInfoView: $infoFlag)
                .opacity(dragState.isDragging ? 0.0 : 1.0)
                .animation(.default)
            Spacer()
            // MARK: - CARD VIEW
            ZStack {
                ForEach(cardViews) { cardView in
                    cardView
                    // Implementation of Drag Gesture
                        .zIndex(self.isTopCard(cardView: cardView) ? 1 : 0)
                        .overlay(
                            ZStack {
                                // X-MARK
                                Image(systemName: "x.circle")
                                    .modifier(SymbolModifier())
                                    .opacity(self.dragState.translation.width < -self.dragAreaThreshold && self.isTopCard(cardView: cardView) ? 1.0 : 0.0)
                                // HEART SYMBOL
                                Image(systemName: "heart.circle")
                                    .modifier(SymbolModifier())
                                    .opacity(self.dragState.translation.width > self.dragAreaThreshold && self.isTopCard(cardView: cardView) ? 1.0 : 0.0)
                                 
                            }
                        )
                        .offset(x: self.isTopCard(cardView: cardView) ?  self.dragState.translation.width : 0, y: self.isTopCard(cardView: cardView) ? self.dragState.translation.height : 0)
                        .scaleEffect(self.dragState.isDragging  && self.isTopCard(cardView: cardView) ? 0.85 : 1.0)
                        .rotationEffect(Angle(degrees: self.isTopCard(cardView: cardView) ?  Double(self.dragState.translation.width / 12) : 0))
                        .animation(.interpolatingSpring(stiffness: 120, damping: 120))
                        .gesture(LongPressGesture(minimumDuration: 0.01)
                            .sequenced(before: DragGesture())
                            .updating(self.$dragState, body: { (value, state, transaction)
                                    in
                                switch value {
                                case .first(true):
                                    state = .pressing
                                case .second(true, let drag):
                                    state = .dragging(translation: drag?.translation ?? .zero)
                                default:
                                    break
                                }
                            })
                                .onChanged({ (value) in
                                    guard case .second(true, let drag?) = value else {
                                        return
                                    }
                                    if drag.translation.width < -self.dragAreaThreshold {
                                        self.cardRemovalTransition = .leadingBottom
                                    }
                                    if drag.translation.width < -self.dragAreaThreshold {
                                        self.cardRemovalTransition = .traillingBottom
                                    }
                                        
                                })
                                .onEnded({
                                    (value) in
                                    guard case .second(true, let drag?) = value else {
                                        return }
                                    if drag.translation.width < -self.dragAreaThreshold || drag.translation.width > self.dragAreaThreshold {
                                        self.moveCards()
                                    }
                                })
                        )
                        .transition(self.cardRemovalTransition)
                    
                }
            }
            Spacer()
            // MARK: - FOOTER
            FooterView(showBookingAlert: $alert)
                .opacity(dragState.isDragging ? 0.0 : 1.0)
                .animation(.default)
        }
        .alert(isPresented: $alert, content: {
            Alert(title: Text("SUCCESS"), message: Text("Enjoy your next trip!"), dismissButton: .default(Text("OK")))
        })
    }
}

#Preview {
    ContentView()
}
