//
//  MarkDownView.swift
//  WWDC22
//
//  Created by Razvan on 21.06.2022.
//

import SwiftUI

struct MarkDownView: View {
    var body: some View {
        Text(
            """
            I just love **bold text**.
            I just love __bold text__.
            Italicized text is the *cat's meow*.
            Italicized text is the _cat's meow_.
            This text is __*really important*__.
            This text is **_really important_**.
            
            
            At the command prompt, type `nano`.
            ``Use `code` in your Markdown file.``
            My favorite search engine is [Duck Duck Go](https://duckduckgo.com).
            
            I love supporting the **[EFF](https://eff.org)**.
            This is the *[Markdown Guide](https://www.markdownguide.org)*.
            See the section on [`code`](#code).
            
            <https://www.markdownguide.org>
            <fake@example.com>
            
            
            ~~Just Kidding about the Terms~~
            
            """
        )
    }
}

struct MarkDownView_Previews: PreviewProvider {
    static var previews: some View {
        MarkDownView()
    }
}
