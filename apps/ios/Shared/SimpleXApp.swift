//
//  SimpleXApp.swift
//  Shared
//
//  Created by Evgeny Poberezkin on 17/01/2022.
//

import SwiftUI
import OSLog
import SimpleXChat

let logger = Logger()

@main
struct ImageDemo: App {
    var body: some Scene {
        WindowGroup {
            VStack {
                Flashing()
                NotFlashing()
            }
        }
    }
}

struct Flashing: View {
    @State var count = Int.zero

    var body: some View {
        VStack {
            if let image = UIImage(base64Encoded: testString) {
                Image(uiImage: image)
            }
            HStack {
                Button("Flashing") {
                    withAnimation { count += 1 }
                }
                Text("\(count)")
            }
        }.padding()
    }
}

struct NotFlashing: View {
    @State var count = Int.zero
    @State var image: UIImage?

    var body: some View {
        VStack {
            if let image {
                Image(uiImage: image)
            }
            HStack {
                Button("Not Flashing") {
                    withAnimation { count += 1 }
                }
                Text("\(count)")
            }

        }
        .padding()
        .onAppear { image = UIImage(base64Encoded: testString) }
    }
}

let testString: String = """
data:image/jpg;base64,/9j/4AAQSkZJRgABAQAASABIAAD/4QCMRXhpZgAATU0AKgAAAAgABQESAAMAAAABAAEAAAEaAAUAAAABAAAASgEbAAUAAAABAAAAUgEoAAMAAAABAAIAAIdpAAQAAAABAAAAWgAAAAAAAABIAAAAAQAAAEgAAAABAAOgAQADAAAAAQABAACgAgAEAAAAAQAAALygAwAEAAAAAQAAAGkAAAAA/+0AOFBob3Rvc2hvcCAzLjAAOEJJTQQEAAAAAAAAOEJJTQQlAAAAAAAQ1B2M2Y8AsgTpgAmY7PhCfv/AABEIAGkAvAMBIgACEQEDEQH/xAAfAAABBQEBAQEBAQAAAAAAAAAAAQIDBAUGBwgJCgv/xAC1EAACAQMDAgQDBQUEBAAAAX0BAgMABBEFEiExQQYTUWEHInEUMoGRoQgjQrHBFVLR8CQzYnKCCQoWFxgZGiUmJygpKjQ1Njc4OTpDREVGR0hJSlNUVVZXWFlaY2RlZmdoaWpzdHV2d3h5eoOEhYaHiImKkpOUlZaXmJmaoqOkpaanqKmqsrO0tba3uLm6wsPExcbHyMnK0tPU1dbX2Nna4eLj5OXm5+jp6vHy8/T19vf4+fr/xAAfAQADAQEBAQEBAQEBAAAAAAAAAQIDBAUGBwgJCgv/xAC1EQACAQIEBAMEBwUEBAABAncAAQIDEQQFITEGEkFRB2FxEyIygQgUQpGhscEJIzNS8BVictEKFiQ04SXxFxgZGiYnKCkqNTY3ODk6Q0RFRkdISUpTVFVWV1hZWmNkZWZnaGlqc3R1dnd4eXqCg4SFhoeIiYqSk5SVlpeYmZqio6Slpqeoqaqys7S1tre4ubrCw8TFxsfIycrS09TV1tfY2dri4+Tl5ufo6ery8/T19vf4+fr/2wBDAAEBAQEBAQIBAQIDAgICAwQDAwMDBAYEBAQEBAYHBgYGBgYGBwcHBwcHBwcICAgICAgJCQkJCQsLCwsLCwsLCwv/2wBDAQICAgMDAwUDAwULCAYICwsLCwsLCwsLCwsLCwsLCwsLCwsLCwsLCwsLCwsLCwsLCwsLCwsLCwsLCwsLCwsLCwv/3QAEAAz/2gAMAwEAAhEDEQA/APA/FGkarLvM0BXAyTjHFfMGteH9etria48w21sg3bnPB+melfv/AOLbzwXNuh1XwxdGYkkbbcsCo90yK+Ovir4X+CvimGS20fzLO/iGXtTGSDntjHWtamcJ6ps/WsLh+a142PwR17xos+oXOlXbqy5KqQOv9K8G1bT/ACZX8rc6scjHSv2R8QfsxfDi6nSW7sprRrkkJvjZVZvY46V8k/Fr4JxeA0H9l2rvAzkE4JwfbPauKWZXfc76mWOUXtY+MbLV9Ti0pkI3FQVRgOn1rOuNWub23FpEnls3DkHANejXtheaazvY2jbJOCjLyK53+x71pDPNYMVzyM4P5VP12+rPPqYaolyp+uhwml22paXeC6Z3wGBIB96/QL4V6pY6zpgD3AVlX7rED9K+YLLwLPqm1rUFI2GTvOMV0dvYnQrhbDT97lR8zAmhZg4u6ZvhcHOmmpL3WfTGveEdKvblQJIdn8RJFcFr/wAMNNurdvsZi7gYPUfWq/hiGS7kQX/mspIyqn5jX2f4P8G6PJZx+XpUr8D75H+NdbzOFVWZ2QwLl00Py81X4W332hotOUFxx+VUrL4GarcTCe63hl7AZr9rdM+EOhXi+bcWMcbMeAeT/Krd58HDk23h2wM0hX+FTx/Suf276SM3ktN6yR+NMPgDVNDkCxQMyjqcV3tvo+vyw+VEnlgjsO1fd/iH4D/EORvskWkzIqkkkIRn6k1qaF+z/rsdksN3ZSJPIp8x25AGeABVwxWvvMz/ALMcXaF0j87TFqtiRbSud3YGtfQfDl/q94qyQGSNWy+flXHua/Vjwp+yRoS+Vq+pRS30vTAXkD6dMCvU779mXwVpVg99Aotnxu8uT29e1ddLGKOqJeXyv7z+R+YGi6Np2h3cji3MssgHEQJAHtWN4u1ttJ065ntrCSQv8pOSuwkfrX6Njwj4c0WwI1FkjyP4FBx6cAZ5rwzxr8L9L12zOoaRKtwVOcNlfw211/2jpbuKWBe6PyYXxP4zXUTaWUYiDNn5ly1Xk0PXPEuoeTrRIQHJG2vrPX/hnY2GstrGo43AbtqjHIrjl8Oaz4m1QTaafKiJA4GBge9EMRolc4vqL153c1Ph34M0PSJ4rl0OeMPxkDvmv0K+Hmu+BtEsBN5yyY7sQea+QrDwPHpGleTn7VKw5Knn6daxk8Ma7aTi58t4YQM7d3GPpXf7aMlvYl0GmfpTpvx08P6NO32QRgP93A7+9dhF+0jAFw10i47L0/nX5eXGqbdN+1X25Yxx1xjH61yUE2r3oa4012MJJ2kIelS5xW7Mlhk3sf/Q/bC9134dy2UkNgwhLj7ymvk3x/8ADf4Wa/rR1O8ukSZhy44Yn86/I6X9ofxhpt1j7U6rnow4/Q1y3i/4yeJ/EsCuJwm3ksGP+NfltTF4iXxOx/RWFyOnRbcKjP1D0j4UaRBJPZveR3NmSWhSUmTYfUEnIry7x/8Asp6V45t5UvMQlnBUxSHGB0OOgP51+c2kftDa7osyx/bgXHB5z/OvpDwr+1J4lEKyzEzJ6oa554vE03zXPThgr/DP5NHO+Jv2N7Twfqn9om9N5DEMrFKoY5615Z4t+A1h4lmikt3e0d2CkrB8uD64r700L4tR+No/9L09Z1I53kZ/lXtngbRptdnJW0FvCuCNoXn8jRHN5RXNPc6p4RRh+8R+YHh79jzw88sQmvJ7jaeUSHG7/D61774e/YN8P6rc+ZaWE8PfdIuAa/Vfwdpthb372a2Ls0eCSyAL+B7161qHjPwx4SsvtmtR+VEvBbbkA/hVxzeVR2ueNXxHI+WlSuz8s/D/AOwJ4X0W9jvmjLbOeRnBr6e8O/syaCgVlhAEY+9jBNfQGlftLfBzUL86WtyyuOcmPivTU+L3wnjsmu475JAiFsKOTj0HFd9LF1Las8+ticWtPZNeiPmiP9mLQ57hLqKAxyKc7h613+i/A2PSpvPkczZOcOP5V634Q+MngTxUzfY5mth0CzpsY13UN+kUjTrZ3F0h5jeJSylf6V3Qxc+551bE4qLcZqx8+a38IrS58md2aIRkkoo+Vs+vrXMN8Co7o+UkzMGO4fIBgelfWc+q6YjhtQgnt1HJLRnH6ZrH1rXvDemweQha5kZhiII2/n0FbwxM20YRxVf4Vc8Uk+HFjovh9tM02BPtJUjcQOM+pr5W8a/ALWtasrmHUrlriVFLRAcRpnoMZ5J9a/SGy8I+JdW0v+0tM06PEikgXDlDz/s4P615/ceDvFWkQ3N14iggtCSW3RbXZuMBRx29a7IYmUVeTFSxerSavc/C/X/2dPF2lyS3kk88cqMTymV/D6V5pr3hHxTGoSe9dVH9xNpP41+43iH4PaxrFo2p3GqyoHXG2RQQAfTpz7188Tfs9eHJp5LzWppLpYuoB2qSe/r+VaSziEdZM9Wiqc476+Vz8XNV+FN7PP510juh6vI2c13ugfArVZ9K+0W6iOMjj3X19q/XCH9mfw9r1qLfT7QQZ5DMCzfQV13/AAz3peh6alrqkErhvkUdivpgClLiGNvdZEqFJO3U/I/Tvh94bgtTCZC023oqng1yfibwHLdKLCDaskw8tFkbacmv1r1H9jO1vZ4dR8Pat/ZcbHc0Fyhbn3OcgfhTLj9lLwLYPGfFHjG3a6PVIo1VF+hOT+NdNLN1LVSOefsF5s/OP4ZfsGeJPEKwajrMaeSTuZx86sPYg4r740f9kHwXpmnRWckIUoOQIsivo/wkfhr8LtAXTn8WRwrGCAzSiZCPaPsfxrpP+F3/AAR7+KkY9yMKCfoaznmFebvdnnVedu0I6ejP/9H5H1X4CeKtQDTW07Qt/cZvlrFtfgL8RIkZW8uQHoS1f0deI/8Agn/4sYvLDCUHbaBXgut/sMeO9Pm8yOGV8f3ulfgNXPKkHaat6o/qvDY3AVF7taP3n4cj9n7UYJPtGrwxMx6gHB/Oug034aX2m3AXRoOn8Knn+dfrzefsmeN2UxXdoxXpyKfov7F+tTy5mhdM+ma5ZZ7feR3qphIq7qI/PDRdD8fw2oW0tZoHxjKZH+FeyeCtN+K+gg6la6m9tL2RyQDn1zX6E6R+yLraRC3iufkU9CwyP1rqV/ZMkY+TNOjMeDucf40o5rF9Lo46uY4Nae0R8o6D8QfjtpEXnSyi4RTyY2R8V0E/7QPja9P9n6xpkc8ZGGLoOfqK+r4f2P723hZ9P3ndjPlng/lWJafsneKrS/eU2jsrcZPNbxzOCtaP4HD9ay+bbco3+4+KI38Oahdy63daWkN0W4IY7QPYLj+ddYPGd7YwJZ6dAJo1HyiWMOoPtuyfpX2nF+zBq6yiEW20n+EgZ/Kppf2Rtfky7xlQexHNdKzdtaL8AlmGB+1NHy3pHxb1Sw1KC+m0o3TIAGUsNuPZQMGvtzw78bNMn8MpLpQuJpxx9ijiywJ9+ABXk97+y14z08lrSFmQe3NOs/g58R7B/LtomhOOqjB/Ot6ec8vx3OLFUMBiYpxmrrzPavC3xF+Jt1qUa6lpthHEWyUkly4T+Wf616vqXxa020v0tI9J8u5c7Efbnd9GAPFfJi/DX4kaXdLfLNLDKvRk4P4+tU9b8N/Ea9idbrUJ5C3DE8HHpxxXZHPI9GeVUyXD1Zp80beVz6lsvixBqutPpOpX5hkUcRRN0Hufarmuaz8PiBNq2sK+0Z8uWQckV8Ep4L8Y6bK7QGUluC2cnFZTfD/V79nW9tpZXPRyxOKUs8p2s5G3+rtK6lGpZeVj7WuNT8OeLk/0XU7aC0iIGN45/M1QuPDXwsvj50mvWq46hZFAr4Yuvgh4uZjcWjOoP8OePyrmbn4GeKdpE29QTziuCrncHo1c7IZHBfBiLfJH6s6P4t+Enh2zjs01K1mYDACkMT+AzV26+InghrN7qOMtEgPz7Rj8O9fkvb/B/XbAho/NY+tejaXpviPSbX7PKskwA+6zHBrH+2orZmE+GKb95VW2es/FH43+BohJHpDyXUsgKqqcAGvibxj4v8b21g2qeGbRbSV0Ks0wEpPuoPSvXdai1WS3ktLPS40d/wDlpt3MPxNeU6j4Q8YTtjyHIPqTiu6hxJTimrnp4fJKcUl+Z8L6hofjfxJfyahq94wmZiSpOB+QrUtvBuqeSPtG0t329K+sG+Hurs+Ly2z/ALq4NdRafDC4eAMIZB+FbU+IYveR1Ty2Eep//9L678E/ts/tV/De5RtFuLy6sZW+SK6ljuUwOCON2Bn3HFfTWif8FYPEtnKbP4l+HooJkk8mRpCFVm64jdSVbjng1+Hus+M7PQrs3ummXAzuCOQnXoGA7Vrw/Fa4gtP7WtAxTDEJIv2iP5gQflx3GRX8i0sVi4RShKVumrt9zuvwPsaWOg3ruf1A+Cv2qvg38XbaODRtUj0i9kTPk3SA8/7LYxXQ6r4Y8RXdsbu2v0vICeCgyuD7rX8oenfFPT76aK3s7YxbXAVtPke2ff1OEbIOO+K+xPh1+098SfBE0c3hDxTeW6cb1vQGUYPoQAwI7YB96645pOEl9ap381o/u2/I9rC4/T92/wAvzP2vvNJ1LTpD5McYYdSMk/zrHuPHdl4bTzNeiiH0JDkf7pBJr5d8Mft1eI73bZfEvQ4byHYuLvSwA7seOVLEe+OtafiH48fBHU91zeQai7qQhXYGYH0I4OPrXcs6w/8Ay4/HT8NvxPcw1X2rtWT+R6xrn7UA0mB/+Ed0so/RXkYnJ9lGP51w9l+1l8bBKyW9xHtccBoF4B9ODXmumeNf2fvGM09vFrP2K46CG6Uwtu68A8HjsDWT4h+Ln7OXw+JfWr+VtvLCCMn8y2Otb/2lLdz+5r9D14PL4wf7q/qr/mesn4zfFbUrr7a+oTLJnOVUKP5AV6foHx9+M8YEC3glYDAEkSHHueOa+I/DX7cv7Jeu6nJo1tdXVqlswVmePGSx45qX4z/8FGv2Tf2fLNb25Goa3Ls3oLeBljOeRulIKD860pYutzqEObmfa5z4jFYRwbdKNl5I/VDwx8ZfineRquoabbXJYfeEZQ/pxXUX/wAU9f0SZLvxPJo+noxwIpyEJx1HLZzX88Gv/wDBQr9qX4sWTat4MuLPwjoAAZIbCNprmWJxlT57fJyP7tfnR8QfiN8T9b1We81jUL27mmcySSSyGRifUHPBNegsbKT5HO8keHVlRTb9ml6XP7W9I+J3g7xPcG3gl0q8dl3JHbXSF8Dr3bP5CuifS/BepRhrm3Nm54Iddy5/3gK/hi07xTq/iqS2s9blvLOdD+6v7RmhuFPbLHhh7GvfLf8AaQ/bM/Z9gSfwF8QbzULcpuxNiVVA6LIr5wf9oZX3rupTpTahUtd90vzVvzPPlV5byhdej/4P6H9iM/wq0i6j86xjR0P8QAIrnpPAmlaaQzwL7YQn+lfyVad/wW8/4KA+EbFb26XRtVt4T87S2WGwO7FHGR7gV7P4P/4ONvjnDcRp448BaTdICNxs3liJ9SAzMK7pZHRmrxj/AF95lDOZ35XP8z+mafTdEg4e03fSPH88UW+geHL1Cz2wC+hXGK/F7wl/wcSfsu6zB9k+IPhjV9DvT9518u6hB79MNj0r2vwn/wAFQ/2efjXfGz8A+MLO3Yrn7NO32OQ/TzAAT+NeFmWWqhq6ba8k7feexga1TEO0ZJfM/S648KeEs7VtQx9BimRfD3wXc5MtptI68D+lfE+u/HTV9PsftFrIZopFDLKCXyD05Q4NeCR/tQeO9JvJ/seoTOh/heLKr/u18vOdG+x9LRynGTjeNS3zZ+rMXwr+H83yvCIz7ipZvgN4JuxlNq59RX483v7TXj+4uVu21WYY5KkFP0FVbz9rXWn/ANH13U7vz8A/u5HZdueOARzSjVoa3j+Js8kx91aufrnL+zJ4cnbdCByfStu3/Za0kxDL4/AV+TS/8FGPEGk3cB0+6mneBQv+kHCHH+yAS31rYm/4Kj/GKVs25s4VAwFjtSw475L9a6KNXBq/tFIwqZXnWnJUX3/8A//T6TXof2fvE+qRadq+gtpM0yNtuLHMG5iWwNhzGeMHkfjXl13+zi+uRprnwe1m21KYgobaf/QrhevysrExkn2Kk12fjDUPCuu6k09lKLRBtZbm6ZJc7mIGQhwG/vrjgV826tez6NA9vpUxGoeZ5kZH+pmUFigidjg+vzV/HWEhVa9yTT7S1X/DfM+jqRitakU13Wj/AOH9UZni34b+MdGm/s7x9pN5pV9byZWeSNkjI9VkTIyfXkVwbeLvGXg28ih1Evc2aNhGk+fcPUN149Dmvprwj+038Sfh9ZnTNfaS3sg7yLJIPtcDHurDjbg8ZxxzXpul/tEfAz4jWiJ43s7GzlmO0SNGrW7tn5h8+CGByCAcntXTKtiIfxKHPDy1+7/h2ddDDU5StCtyvtJfr+tkeBeG/jLYzCO4ExtyYz85z5bN6dj1x1zXu+j/ABC8PeJ7ZbLxOiB1QotxvI56cOoyoz65FdXL8Lvh34othN4NjSW1lX72nupcbTx+4lww454Jz2zXnF78JmeeS202UefHnCAG3m9sxt8pz6DHNeXOrh5vROL/ACPep0cTTV01JfmdkbLUdRsGtlg/tu3bJHl7DdRgZwVYFlbb+ftXzx4+0HxyLFrvw3cPrEEYxLZywLHdov8AuYAbGO3J64rN8YeB9csdPebSZJbfUMblltz5FwmDzwDz65A/GuR0f4t/FWyX+wvE8kfiK2hGyH7bmK6jYEZ2yqRlgPXPXpXo4SDtz0pJ+T0/r8AeMl8FRNfPT+vvPMbPxxbXFvKrhrK7DYkikRVdmyeCDgjHfNdRpnxe1nSyLK98g28qEPGFDKV7hiRtOfRga0PE134f+J7Imp20WoXMQ2yW92Ra6igPJ8qYhUlIzwCVb614br+lat4UZrLR0uLywjPzWN5F5V/GO5wQBJ+B57Zr2qUIVNOWz7f8H/O3kyPbNLmi7o+yvCPx78Ny6VDoEmi2TW0a7ESBRA0a9guwBT+Kmupn1DwD4mhL+GZvsN2RgQzAR5OOQG+6c/h9K+AdT0e2XTjfaURFccsmAVHHYjqPeqvh/wCJ9/pV6th4qi86HgMOpwPQ9/pS+o3vKk3fsEsdb3ZnufxB0S3gvRFq7NYTOe6/LJ14yDg5rwa3+LXiH4ZahHp2qbb7T1dvJabJeHPVd3Uex5BHUV7BZ+MI4mkOiyDULN1w1qzfwnsFblSPbisDVPC3gHxzYvpNpdeRcyjaYLwEANnI2sOVP149678NXUPdrK6/r5o4pe870pWf9fecnaz+DvE9pP4p8GqN+4tdWu0DqMkiPgMOOduM+lfL2rP4cv76f7LC2mvvIETL+7JPp3XPpjisH4q/D3xL8KtZJKyx20nzIwOQrf7LDgg/WvMovi5JEAdSAmkQn55OWx3GevNfYYKE3DnpS5ovY8yriVGXLUjZ9Sn490nUdA1Nrp7dPJmG5HQkr+Oa86TVrqIDyFEcrNgMD83554rsPEXxgs9Xim05lnjt5hjDSb1B9QcZU/pXzrrWo31jMqCVpoiMRseMj+VfQ4aNSUeWasyfrkYyvF6H6ifswftr/GH4aagvhWDXJXs16Q3MnmR8dsN+nNfs/wCB/wBvDwXqGjxah46tbG4QL+8jhfybj8Bypx68V/IJbeIJvtAGSjE4LL1r1XwZ42ubWby7xmOG5JPr/L6142acM0a8nU5Un5I+syriacIqHM/vP64ND/a0/Z38cXx0+CwvLZ2kKlS6yFRnhsAdB617FdfDnwl4p09dQ8GziYSDO0qqenHfqPpX81fwg+KNhpl7BcSsM/KRID83HQ561+yfwO+O1ndJDJFdruGMgcK39M/5xXweZZFGjf2aaPtsHnVSXK3K6O28TfCbxJaXvlpYyxpG7IzscHbzyCckj6V5pffDXxysoS0tGlQDGZJWQ5yegVulfozoXxdtdV09TceVeqjBhHLyCvoG6qfevV9G8TfBvULQ3kmk+RI7Hehm2kMMA5Dc187GnWvZI995tCKV0f/Uytb1jwx4+S58V+HLaytridnDiMmZZpmySq8ZZWDqehwOeCK+UPEfjXw7pUE+i67p9zBHPDtaOZsxCQ8GOJ1YhdyhTtGCAuSQRXz2vjbS9N8aX8vhTztZ0BLuO6gk5iePeMtsKkDbtO1icHIOD0NdHP8AE2303WMfZl1bTrq1k8pwfN+ymclGMz87wCxO1VyQD2r+aaWRSpOyu09V0f8AXqepKrK7mrLz6Nd0rbHpl942t9LgGn6BeLqOnNEkpikIScDpmMn7wyMHByTWEul6PqVnHLpjGK41HYAJVdR3IBX+Pry3v0r5/utQ0fUdWnuPDdp9nh052bgAx7t37tWU/OsZA++NxJyfSlk+N0WgvaeF9Y1FJdJvbdjHiQKPNKgSIkmByGyRuKkHHPWul5VNK9Fa7vv/AJN9Rxx8ou82mvwPXotS1PwVfxvoyyW97HMFfy5iEUwlSVQkYXdzkD9K9th/at+JlvqEena3FLdWsUhilivYfOidySCQzZYEdRgj2r47m8VWUumLHqOpPdPMyTQw6lIIbsxlSPvqVjkGezYPHX1z5tathrskdzewva+YsPlozKvzKB5hcEJn0Ycj0rKrlkKq/ewu9en5f18z0MPmFaD/AHTtft/wD9KrP9qD4Y+IYhB430R4oiQiFZt0kbDqQGIZAR93DgEdqd4kT4ReNNK+0+ANXgtrq1fJj1RcwvkcKzxkspPZsH8a+AtG8VLqGl3sWsQ+fBAAy3Kk3EmFIQYbAZu2QckfStO317QL51h0m6S4LxkSttWKRODuQgj7o/2hkHuK8eWTRpyvTTTXzX9fM9qnm0pq1aKfqrP71/wT7jPwjk8bQpDdWSC5SIBXsrpZo8gDJQnDnHXBX8qy7r4SfETRdLe0YnU4F5jjulBKhTnaUbjnkHBBxyOa+UrDyJBbRaJrc1tlSsckEjABgN6ocEYJwDu44xXo1j8dPi74TSG2tPEcepSSqziO7Zgdq9c7lOAeo6/WuaWDrp2pTXo0/wBb2+83VbDP3nFrzTT/AMjm/FXgfw/Y3hluYrzQnwRIgQ3FryRuCgnfGDgZ2n3Fcp43+HbaxcSavoF9YXcEkEbMiExMsoHzbFPQE8jJ+tfRk/7TPiT7LPF4o0qw1AkbssoCFT2V1HPU8Eg5rlr3xf8AB/Xyq694auNNdlJkks5CCvHb7wPrg8+1dNPFYyCSqRvbtZ/5P8TKvClUTUZrXumvyuj4Z8WaZ8Rfh7pzeINBjFxP5eYlifPOM846Y7+/FfCuv3nx2tdbfxLqd9dvqDrjeshIZTnPAxwM+ma/Y3V/h94Q1ZHh0bUr+CCRdw/tC3Vo8Y7yQsxz7FPrXi2o/sx+OtVLSaReadqlpGDhI7ry3AAwCocL04yD1FfVZVndCjf2ijd9WunY8avgaj0pp39U/wAj4p/Zm+MPxC1fx5e+DfGl3Lq8R06VY7a7cEIbceYSgYEbsAhsg5B56V6z4v8ADPwS+IthJeQ6VJpN+q5Z9PcJtI4+aF8g+pwRnmtm/wD2a/HOjeJovEw0J5ZrNyRNbOm51ZSrKWU8jaSDnrXnvjv4U/E+zvXv9A0a9lsSd0WRulVRj5TtOcp0zjB61688Vhq9aNXDVFB26NJX/X5o57Vo0+StTb9Uz5L8bfDjW/C7T3djewalaQc+ZGdsgB4+ZD3HtmuV8L3umqyf8JJGZbIuBIqna2Dxlc969t8SaV4xs5WlbTbtVcYZZIHySPbGCfpg15o3wz8f+Irh/wDhHdDv515cLHE4I7kqcAj6GvpMPiFKnarJeuiPLnFxneEX6HWXvwp8A+IrZ9S8EaykJQKXt747HXPcFQeB9K53Xvhh478ERRXc+nM9lOuVvEIltpQewkUlf5EV6r4e/Yu/aU8XWNjqCaclql2Cc6jNHatGq8gcncT/AMBI96+w/hh8AP2gPh34am0LxF4t0PSbKYlWgKyX7/MOyjYvPqWxXFXzajRVliIz8r6/hd/gephcPXk7+xlHztZfjb8z84NH8Z/2TcC3uw9u8fChuBx6HvX0L4D/AGgbrw2DdWGoMpOTyx2k+mP145r7P0/9ln4Saeg8QeK/G/26O1XDgQx2iF+pAEWWLH/eyT3r0DT4v2Q/hdpceveGtJ+2TSsPtE8sZd0XBYgofu5HTIzjua83E53hKq5adKU35Jpfil+R9Lg6eJp2dSrGKXdp/kzmfhF+178bPElvG3hLwXevJvX99qsos7aWLOCyph5mPcbY/qa/TfT/ANojxXbWccWr6HdC5CgyfZ/niJI/hLqGI+oFfnM/7Xvw98OwO+lJbWVjKzOCuxZZUTOCeMJk45ZfbNfNfjD9r6z8SeIZ9S0bSdU1GDhBK8kjHKjkZQhcDtgAYrxJZfXxUr0sLyR+9/O7X4HsLNsPTX72tzv7l+B//9X8HPgX8Wb3QfAk3wn8XWpNmrO4jkXF0kJBQONw3fIcdCcgZ6Vl/ED4fL8NXs/iT4D8WS3iRWsjTR8iRHXDKpVN3PzHdkD3r2qL/kM6R/2Cj/6SQV3Fn/yB9Q/7Ckn/AKLWvx2ddU67qU42U9ZLo+nVaHU5yqxjSnqlovKx8bXvjfwoNbvtQ1y6uNN8SxkK1zbSeZFcPOVb98udihQcYxnPbNd1aXngzxFo9lF4uuBcC0tJSNqjHypuCqVGcDdjJOTjFeFfF/8A5KVL/vf+zJX1D+z9/wAgS2/697r/ANJpK7MXCMaUaivtf006Pt5HA6rVWdKy/po5zxw3hzw5ollp/h6WZfMiR1ilH2gQBwpyVfPzFePkYDPHWvL9I0dvEOkxt8M5biG8jkZ53aVUjMqEv9x/l+YDhecfWvrh/wDknOrf7sn/AKLeu58Of8kIu/8AsYF/9Jo68+niOWi5Wu0+r323013O+MXztX0Sv/wD4N1bxpeWN1GviW+fT4DFshaSLcjXBZWJBQjnJAYr0FdzoPi281m/1KWSW2Yw74kCT7VmJVQgjZs5I78jODnvXUfE/wD5N50P/sbJ/wD0COqWn/8AH1F/uD+T1cVCrRUuW2/4O3ZbkU607q7Om0Hx34S1TxFZ2FusllOruCm197OisNhySr5zwcc+9UH+I3g7VLmfRdQ1O4gbzTGwSB/mUjbgFSQPTGAc9q7nwv8A8g/Rv+u8H81qp8TP+Sl+JP8AsI2f/oKV5MIUpVeWzWnfzt28zqjiZ+zctN/0KsmseH4bAafeRvcG0MMQAMhDNxhWILAZP3uOM89Ki0fxzpNtYWBurSSGaa6Rt4kePajEoysQhwVwD9BkGt7V/wDkBr/2EY/5GvT/ABV93Rv+u0//AKLNc1X2cUk43v5+R1xxU2m9NPLzPFdF+KiaNq97A91eNBLI0TpKN8DGQnDKWQ8nHUnNdfN8TLFGe5i0s5+yFrV+VWfgg5QN12ggsCB0NcDrP3pP+uR/nWkv/JLLT62v/tzWlTB0G1Ll1dlv/kEcXUszZ1z44w6N4c32sEttcIPIkaCN54tuf4wZDggnC9vWuR1Hx/4yi01tehisbNjMsdvFtQKSVywOG3EkYyD3Ncb4T/4+bb/rxk/nR8Zf+PW3/wBxv/QmrpoYKipxgo7t6vUxljatSLm3Y6fRvitqNhftDqhWNmdYwYiv7turfKCBnvjPbHHFcp4o+LGrh3tBqtq8Mc22OGT5XYtzljngDtjtXP8Ahn/knum/9hO4/wDRcVZmkf8AHz4i/wC2n8lrt+pUYzfu7f52OZ46pH3b36naP8TvEB0lLXTts+qQuS8WEWMpj72Mg4ZjxjjAzXF6z8cb7Q7iHVtZaOe6YzxmPzSohdQNrFlJDKST8ozWvdf8eSf9ecv8q+W/jr/yJcP/AF0m/kK7svweHqVY03Ba/qR9dm4O2/qd7rPxx1S50oLpka38zMtvGlvHImWj5Uq2VUkZBGV3etRS/G74seL7K6HjFYdN8hEZVdNssnIUKF2kFyo3BmwSEOSelafw4/5Kv4K+kH/oAr1bxn/yF4/+vmL/ANCkrvm6FKUYKktVe/bW36HJWxlaPu8ztqfM0GonWbFtGsoIdeMavdzPLb+VKoRlGSVwrqAc4JwD2zTvE2q/EiLU9mgW0UNuI0G1WI+YDDE5zySCeOOcDgVP4X/5Duj/APX6v8zXZfET/kdtS/67t/OuipUUZqCitr6+ttvkclbFzhBSR//Z
"""

struct SimpleXApp: App {
    @UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegate
    @StateObject private var chatModel = ChatModel.shared
    @ObservedObject var alertManager = AlertManager.shared

    @Environment(\.scenePhase) var scenePhase
    @State private var enteredBackgroundAuthenticated: TimeInterval? = nil

    init() {
        DispatchQueue.global(qos: .background).sync {
            haskell_init()
//            hs_init(0, nil)
        }
        UserDefaults.standard.register(defaults: appDefaults)
        setGroupDefaults()
        registerGroupDefaults()
        setDbContainer()
        BGManager.shared.register()
        NtfManager.shared.registerCategories()
    }

    var body: some Scene {
        WindowGroup {
            // contentAccessAuthenticationExtended has to be passed to ContentView on view initialization,
            // so that it's computed by the time view renders, and not on event after rendering
            ContentView(contentAccessAuthenticationExtended: !authenticationExpired())
                .environmentObject(chatModel)
                .environmentObject(AppTheme.shared)
                .onOpenURL { url in
                    logger.debug("ContentView.onOpenURL: \(url)")
                    chatModel.appOpenUrl = url
                }
                .onAppear() {
                    // Present screen for continue migration if it wasn't finished yet
                    if chatModel.migrationState != nil {
                        // It's important, otherwise, user may be locked in undefined state
                        onboardingStageDefault.set(.step1_SimpleXInfo)
                        chatModel.onboardingStage = onboardingStageDefault.get()
                    } else if kcAppPassword.get() == nil || kcSelfDestructPassword.get() == nil {
                        DispatchQueue.main.asyncAfter(deadline: .now() + 0.15) {
                            initChatAndMigrate()
                        }
                    }
                }
                .onChange(of: scenePhase) { phase in
                    logger.debug("scenePhase was \(String(describing: scenePhase)), now \(String(describing: phase))")
                    switch (phase) {
                    case .background:
                        // --- authentication
                        // see ContentView .onChange(of: scenePhase) for remaining authentication logic
                        if chatModel.contentViewAccessAuthenticated {
                            enteredBackgroundAuthenticated = ProcessInfo.processInfo.systemUptime
                        }
                        chatModel.contentViewAccessAuthenticated = false
                        // authentication ---

                        if CallController.useCallKit() && chatModel.activeCall != nil {
                            CallController.shared.shouldSuspendChat = true
                        } else {
                            suspendChat()
                            BGManager.shared.schedule()
                        }
                        NtfManager.shared.setNtfBadgeCount(chatModel.totalUnreadCountForAllUsers())
                    case .active:
                        CallController.shared.shouldSuspendChat = false
                        let appState = AppChatState.shared.value

                        if appState != .stopped {
                            startChatAndActivate {
                                if appState.inactive && chatModel.chatRunning == true {
                                    updateChats()
                                    if !chatModel.showCallView && !CallController.shared.hasActiveCalls() {
                                        updateCallInvitations()
                                    }
                                }
                            }
                        }
                    default:
                        break
                    }
                }
        }
    }

    private func setDbContainer() {
// Uncomment and run once to open DB in app documents folder:
//         dbContainerGroupDefault.set(.documents)
//         v3DBMigrationDefault.set(.offer)
// to create database in app documents folder also uncomment:
//         let legacyDatabase = true
        let legacyDatabase = hasLegacyDatabase()
        if legacyDatabase, case .documents = dbContainerGroupDefault.get() {
            dbContainerGroupDefault.set(.documents)
            setMigrationState(.offer)
            logger.debug("SimpleXApp init: using legacy DB in documents folder: \(getAppDatabasePath())*.db")
        } else {
            dbContainerGroupDefault.set(.group)
            setMigrationState(.ready)
            logger.debug("SimpleXApp init: using DB in app group container: \(getAppDatabasePath())*.db")
            logger.debug("SimpleXApp init: legacy DB\(legacyDatabase ? "" : " not") present")
        }
    }

    private func setMigrationState(_ state: V3DBMigrationState) {
        if case .migrated = v3DBMigrationDefault.get() { return }
        v3DBMigrationDefault.set(state)
    }

    private func authenticationExpired() -> Bool {
        if let enteredBackgroundAuthenticated = enteredBackgroundAuthenticated {
            let delay = Double(UserDefaults.standard.integer(forKey: DEFAULT_LA_LOCK_DELAY))
            return ProcessInfo.processInfo.systemUptime - enteredBackgroundAuthenticated >= delay
        } else {
            return true
        }
    }

    private func updateChats() {
        do {
            let chats = try apiGetChats()
            chatModel.updateChats(with: chats)
            if let id = chatModel.chatId,
               let chat = chatModel.getChat(id) {
                loadChat(chat: chat)
            }
            if let ncr = chatModel.ntfContactRequest {
                chatModel.ntfContactRequest = nil
                if case let .contactRequest(contactRequest) = chatModel.getChat(ncr.chatId)?.chatInfo {
                    Task { await acceptContactRequest(incognito: ncr.incognito, contactRequest: contactRequest) }
                }
            }
        } catch let error {
            logger.error("apiGetChats: cannot update chats \(responseError(error))")
        }
    }

    private func updateCallInvitations() {
        do {
            try refreshCallInvitations()
        } catch let error {
            logger.error("apiGetCallInvitations: cannot update call invitations \(responseError(error))")
        }
    }
}
