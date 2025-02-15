import SwiftUI

struct LoginPageBody: View {
    @State var studentId: String = ""
    @State var studentPassword: String = ""  //In figma we we have birthdate but ill do password for now

    var body: some View {
        VStack {
            studentIdTextfield
        }
    }

    private var studentIdTextfield: some View {
        TextField("", text: $studentId)
            .foregroundStyle(.black)
            .padding(.leading, 20)
            .padding(.vertical, 12)
            .background(RoundedRectangle(cornerRadius: 32).fill(searchBarColor))
            .padding(.leading, 30)
    }
}
