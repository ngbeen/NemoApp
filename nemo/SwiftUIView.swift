import SwiftUI

struct Content2View: View {
    @State private var isButtonVisible = false
    @State private var textFieldText = ""

    var body: some View {
        VStack {
            TextField("Enter text", text: $textFieldText)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()

            if isButtonVisible {
                Button("Submit") {
                    // Perform some action here
                }
                .padding()
                .background(Color.blue)
                .foregroundColor(.white)
                .cornerRadius(10)
                .transition(.scale) // Animation effect: scale
            }
        }
        .animation(.easeInOut) // Overall animation effect: easeInOut
        .onChange(of: textFieldText) { text in
            // Show or hide the button based on text field input
            withAnimation {
                isButtonVisible = !text.isEmpty
            }
        }
    }
}

struct Content2View_Previews: PreviewProvider {
    static var previews: some View {
        Content2View()
    }
}
