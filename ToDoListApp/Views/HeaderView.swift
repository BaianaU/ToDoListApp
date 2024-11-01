import SwiftUI

struct HeaderView: View {
    let title: String
    let subtitle: String
    let backgroundColors: [Color]
    let subtitleColor: Color
    
    var body: some View {
        ZStack {
            LinearGradient(gradient: Gradient(colors: backgroundColors), startPoint: .top, endPoint: .bottom)
                .edgesIgnoringSafeArea(.all)
            
            VStack(spacing: 20) {
                VStack(spacing: 10) {
                    Text(title)
                        .font(.system(size: 50, weight: .bold))
                        .foregroundColor(.white)
                        .padding(.top, 30)
                    
                    Text(subtitle)
                        .font(.system(size: 30, weight: .light))
                        .foregroundColor(Color(red: 211 / 255, green: 122 / 255, blue: 28 / 255)) 
                                        }
                }
                .padding(.top, 40)
                .offset(y: -300)
            }
        }
    }


struct HeaderView_Previews: PreviewProvider {
    static var previews: some View {
        HeaderView(
            title: "Sample Title",
            subtitle: "Sample Subtitle",
            backgroundColors: [Color.blue.opacity(0.6), Color.blue.opacity(0.8)],
            subtitleColor: .white
        )
    }
}
