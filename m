Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.224.51
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793345321;
	b=U/sT9SWWryohwdx1XlGDaHnvttIk1DDLj9hOWEJD/iiyyn/wpcu4VLUpjj5nOd9cwbsq
	 UXQqkWejbxgZfvW32Hwv/AdUzBwEl5q8eW/C2a7b97Y/j93PTFcPqAxoA65x1HzCG+hCz
	 CBp3I4AUnpufSMqZ72Ygfqo2eWR0DN7JqP63KxNZhm4qFv/n9JxP8GHv7az5Z3C0p54hZ
	 c/wPEW75SfoSswCfPlwFarvupOszrnY7+bZTqsXZp3rS7yUPYxvqWBSDBtyZmKphziXIi
	 izIaZgMFIUJgFT6nYOiA60UzdOrRqJrQJdKWf6QdKotcmEW92pYQPI4VVXZinwcZnXw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793345321;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=7PxPIeRuNsvElsGXImQTEuL1CpgybTHblbxvuB0DOLI=;
	b=aX7AFeie5cKk4jcR6pg6zpLQ55lEW4IHMczWQ2BalnvwP8UilXNc+IIoGVmQCfMrVKKK
	 kq97JfW7Pwkw+o2u1TI2Q4lUdPsTHIjYAhHMj6G0wVhVMEXuoZUabqFy4yXZGWfAA4Ohi
	 ohav3J/n71x8f+zC61WRJw1o78zj78ADCjjOufabBhjh7o/mut2Dq2TaFft08543qWOqE
	 4lgUeCBS/g4JFg41Jlrg95ZrIGIJDF7Y8t9ubupfTTlJTDdYNzyt2yk1Av/dGEGWqmCaV
	 eFGyXGd+F6rkaOczclBkWCahQqVU6rImZ9LId/GhM5TgVBr7yAIDK803sIAhYIxZBtQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=e1u0VV6S;
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.224.51
Received: from mail-yx1-f51.google.com (mail-yx1-f51.google.com [74.125.224.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 276B5606A31D
	for <spacemit@lists.linux.dev>; Fri, 30 Oct 2026 07:28:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 276B5606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=e1u0VV6S
Received: by mail-yx1-f51.google.com with SMTP id 956f58d0204a3-679a420b5afso302718d50.3
        for <spacemit@lists.linux.dev>; Fri, 30 Oct 2026 00:28:40 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793345320; cv=none;
        d=google.com; s=arc-20260327;
        b=qnYpjvApRUOcbVkhBRRhLzFaJK1jUW0DVIFAtCGPuYqXW9VID0iB8cnjTyTVU34rNz
         idH92JJi8tjm4sQN/I/9uYhWMA9ICgQqhMWEXB0+l7VXUaBf+ivs3lepRQ2tTtjvqqKA
         4XXhnRcBF2Brinvdv4XzIvP/KeHy4kvUdvl1ibfjoYNxu52RnbLXJWlfOm9n0IHKR/Gm
         cbfnBv2mSy1Wei8HdTP+EjGe6UyqbAHydx2hEr/wYKk5HC1W+mmeSSWAXIniTLGeORWz
         A9ZLInOQhEDOik1PaqKIOTfniofBX+TojqeWoK1M6fbZpn2/jRsQC5RIKJ7ml/Q4xa/5
         UPPQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=7PxPIeRuNsvElsGXImQTEuL1CpgybTHblbxvuB0DOLI=;
        fh=in3ptAsKA8Zusi3gBkescjL4CYa1PN9c4daP6qOjlrc=;
        b=LNFRZjt/L4xgdVbo+cDDqVZg/e1h0jcBCFpL4nGny63uij0LCWIoZhvzhDluAhJ3RP
         YucztHf/5vG59mQDSNiNUZp4Aq75c8WzeexaQqqYQ7z6y/srSmQx1TIPJrb0m4vDLCtp
         zIRWX4+vc+74+D2WJ0jHXKO2vkscMfHLwdxcaN2eEmCdYXayRofIEeAgYUrcSa9S/QKp
         0obGwGxACtuu1BNgDRccMw2YfUY84+kzDqeqh5jb7AQVW6V1nHcV8qzSulYvymLdtswZ
         xoI8eJ6cb/8i6h7hrgelAPmIJFcPv66GpZQrcQTq7/p41CS/3FUcgguWDCPJyJlKta2Y
         v6wQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1793345320; x=1793950120; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=7PxPIeRuNsvElsGXImQTEuL1CpgybTHblbxvuB0DOLI=;
        b=e1u0VV6SYYi6QwkU5B1SPm4uMgQEMGybYXZ9uSg3cTIQIrOR6jI7TRHyt8+RLRnsKu
         SD28AoKJymf63U88/p2P/pBw49IVnR3k6iH77w6D/KNqfJEdAjs83tfIItQ3/9yT+UrP
         M4DgrwOBWQRyivBSMu8N3pfkb6d3GyzHK98Zo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793345320; x=1793950120;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7PxPIeRuNsvElsGXImQTEuL1CpgybTHblbxvuB0DOLI=;
        b=jcp0zeGQzZHC9ULdtMekGQWVbEwM9/eiRRIiypa8y7gzWMxVvxilBvkU7coHKrXTQL
         TY8Ia6fEEQykHa444eJswb5ErA9NTd7u7mVE/p1rHzHoImHBpbc0SFczri1KT48aLk80
         uDDyAtrhDpUDLHwpZfJxsMjCIncYer85lJc5jIHdJurPsgAMS6C56I5PL6dpQs00IXr0
         4shVmlmBl4PH4pCNRohUqS1dRulunfJgG3BVb2+2kDsO8laLkyhvDfWwEiIWJZiXd/1W
         l+PWZl5G1u8XqFYWwHuo6qQY2lMhCR/wrAGLkl3+EzCCQpC57+wsFOWQqGkV/4Sz9BhK
         oC4A==
X-Forwarded-Encrypted: i=1; AKwUvBxttsDxIsaSKmL61bmgV4PSpJgHGQlevvfXsCCM8qqBc13Pwfri3cxOuNolnmWBmvm4g3M+k1kt3g==@lists.linux.dev
X-Gm-Message-State: AFq9FYLQE0pOe+tjKNJqcudtPErkNQg6JCUtoj2asVg+z/rl9oigGSUW
	Ucc4Px+acIZ0Yjdeq5yvLzLvZNnv141Ca/h7HWp2SKejaMA69S6Rn7SgUqAanjg5iHu8JHBWUXT
	YUw8gPuyZJ/PAzXnRM0ezDKXVkPARIxE2va5IlCkO
X-Gm-Gg: AYBFou1yi3TGuqpD46foQLLVm7Str51psJgnpaoLZqaND8w/6HEiIH1bKR0BsrLI6Qs
	MGjuUehjQlBr6BKohkM2c4dIgcIw+OWaGSL/+WvEvHml2iw0cxNYd/eud6YOrchdHcjHxsMBrnd
	fX521+SaLgkD0at5RQH9iE3WaRXNySw7DGVwyagGO1Yvt/VqnQFfUJRTaKVn8mni9qFiYX8QnHM
	jdbIOgF+wo/3yGXIWYSybDf70DDFqi/L5QqEBTBiXuZUOg0rjXu8eSeaK5+CIKjZMN831zoHrwx
	viXwuV77Sb+fIZLNICCnHwF/V4bMu1Y3K1k2y5TdHeRx/XrJBCGKS2x7pVFKg/U/MCrrcQNLVSm
	vggy4+4xxtrlvqfcuzijPCxXRR8TSHlTyiDWbntxEP5r3iZkyyCvUIBivlI8sdIrqscE=
X-Received: by 2002:a53:ac8a:0:b0:679:9afd:c0c7 with SMTP id
 956f58d0204a3-67ba508d24fmr864212d50.126.1793345320085; Fri, 30 Oct 2026
 00:28:40 -0700 (PDT)
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Post: <mailto:spacemit@lists.linux.dev>
List-Help: <mailto:spacemit+help@lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
List-Owner: <mailto:spacemit+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <20261014082037.1774672-1-wenst@chromium.org> <20261014082037.1774672-3-wenst@chromium.org>
 <7020a7a6-332e-4fd0-a659-d82eb768614c@linaro.org> <CAGXv+5G1kgyumbj7wGf6rPFbg3spSO0zYmEkn-hZT4qUdJbytA@mail.gmail.com>
 <03375a31-0ac6-47a4-b0dc-6327080e1622@linaro.org> <b4c0761b-34f2-42ad-97e7-ab34ae776281@oss.qualcomm.com>
 <8d4d3ec2-3c97-4a46-97f8-048fdf81b853@linaro.org> <CAGXv+5G_ig=k-eH8Cp0ES70WxTHcBS2TVj9VmHaG9caROiAuQQ@mail.gmail.com>
 <8ceba969-91d2-4b43-81d0-b26e7139664b@oss.qualcomm.com>
In-Reply-To: <8ceba969-91d2-4b43-81d0-b26e7139664b@oss.qualcomm.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Fri, 30 Oct 2026 15:28:28 +0800
X-Gm-Features: AclHuK87PpF6mvOIXqHCbuY1WKimiNRH2tQGnceMsfo-UR5TI782gxdvYJm286Q
Message-ID: <CAGXv+5GFogx_kS=N1t8-SFTp+HyxLtoHzhnL6t8Zn0GBiqMoKw@mail.gmail.com>
Subject: Re: [PATCH 2/2] dt-bindings: usb: snps,dwc3: Fix downstream port numbering
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Neil Armstrong <neil.armstrong@linaro.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Felipe Balbi <balbi@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-usb@vger.kernel.org, devicetree@vger.kernel.org, 
	Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>, Sven Peter <sven@kernel.org>, 
	Janne Grunau <j@jannau.net>, Neal Gompa <neal@gompa.dev>, Joel Stanley <joel@jms.id.au>, 
	Andrew Jeffery <andrew@codeconstruct.com.au>, Ryan Chen <ryan_chen@aspeedtech.com>, 
	Billy Tsai <billy_tsai@aspeedtech.com>, Michal Simek <michal.simek@amd.com>, 
	Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, 
	Peter Griffin <peter.griffin@linaro.org>, =?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
	Tudor Ambarus <tudor.ambarus@linaro.org>, Heiko Stuebner <heiko@sntech.de>, 
	Alim Akhtar <alim.akhtar@samsung.com>, Kunihiko Hayashi <hayashi.kunihiko@socionext.com>, 
	Masami Hiramatsu <mhiramat@kernel.org>, Yixun Lan <dlan@kernel.org>, 
	Troy Mitchell <troy.mitchell@linux.spacemit.com>, Minda Chen <minda.chen@starfivetech.com>, 
	Shyam Pandey <radhey.shyam.pandey@amd.com>, Wei Yang <yangwei1@eswincomputing.com>, 
	Senchuan Zhang <zhangsenchuan@eswincomputing.com>, Hang Cao <caohang@eswincomputing.com>, 
	Li Jun <jun.li@nxp.com>, Peng Fan <peng.fan@nxp.com>, Roy Luo <royluo@google.com>, 
	Yang Xiwen <forbidden405@foxmail.com>, 
	Ahmad Zainie <wan.ahmad.zainie.wan.mohamad@intel.com>, 
	Robert Marko <robert.marko@sartura.hr>, Xu Yang <xu.yang_2@nxp.com>, 
	Wesley Cheng <quic_wcheng@quicinc.com>, Stanley Chang <stanley_chang@realtek.com>, 
	Ze Huang <huang.ze@linux.dev>, Aswath Govindraju <a-govindraju@ti.com>, 
	Roger Quadros <rogerq@kernel.org>, linux-arm-kernel@lists.infradead.org, 
	linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org, 
	asahi@lists.linux.dev, linux-aspeed@lists.ozlabs.org, imx@lists.linux.dev, 
	linux-samsung-soc@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	linux-rockchip@lists.infradead.org, linux-riscv@lists.infradead.org, 
	spacemit@lists.linux.dev, Mathias Nyman <mathias.nyman@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 21, 2026 at 5:44=E2=80=AFPM Konrad Dybcio
<konrad.dybcio@oss.qualcomm.com> wrote:
>
> On 10/15/26 11:00 AM, Chen-Yu Tsai wrote:
> > (Cc-ed Mathias, the xHCI driver maintainer in case I misunderstood xHCI=
.)
> >
> > On Thu, Oct 15, 2026 at 4:44=E2=80=AFPM Neil Armstrong
> > <neil.armstrong@linaro.org> wrote:
> >>
> >> On 10/14/26 18:36, Konrad Dybcio wrote:
> >>> On 10/14/26 11:44 AM, Neil Armstrong wrote:
> >>>> On 10/14/26 11:29, Chen-Yu Tsai wrote:
> >>>>> On Wed, Oct 14, 2026 at 5:28=E2=80=AFPM Neil Armstrong
> >>>>> <neil.armstrong@linaro.org> wrote:
>
> [...]
>
>
> >> How about the USB4, does it use the USB3.0 port ?
> >
> > I'm not familiar with USB4. A quick search says that it can tunnel
> > USB 3.x, DP, and PCIe, and it doesn't have its own USB HCI defined.
> >
> > So I'm thinking the USB4 controller would be more like a nexus node
> > or multiplexing node, or perhaps like a USB C connector. It has input
> > ports for all the protocols it can tunnel, connected to their respectiv=
e
> > controllers (XHCI, DP, PCIe). The binding probably would be very messy
> > if one controller supported multiple outgoing ports, as each downstream
> > port has a 3-to-1 relationship with its respective upstream protocol
> > interfaces.
>
> Yeah that is more or less it.
>
> There needs to be a connection between the USB4 router and the native
> (USB3 *port*, not hub | PCIe *port*, not RC | DPTX) protocol adapter
> where the tunneled packets end up at to create a PM devlink between it
> and the USB4 router.
>
> ACPI does that by adding a `usb4-host-interface =3D &reference_to_router`
> property, for DT that's still undecided:
>
> https://github.com/devicetree-org/dt-schema/pull/196
>
> As far as the Qualcomm implementation goes, I was hoping we could
> go forward with base1 numbering as the DWC3 is an XHCI controller:
>
> https://lore.kernel.org/linux-usb/20260929-topic-dwc3_tunneling_state-v4-=
0-63e296346d57@oss.qualcomm.com/

I don't have DWC3 manuals, but assuming its internal numbering follows
that of XHCI, you can't just use "udev->portnum - 1" in patch 4. That
is the logical port number on the root hub.

Instead you need

    raw_port =3D usb_hcd_find_raw_port_number(bus_to_hcd(hub->bus), port1);

to get the 1-based port number for XHCI.


ChenYu
