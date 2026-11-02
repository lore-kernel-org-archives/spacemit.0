Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=54.92.39.34
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793589831;
	b=A5gfYCeE7ux86JmYyrz2VqtZj2IZWGwHgH9u74X7pFEgGluVJuIlPPt7bJmcYwpjlI02
	 4e0uWLMLxUBbv9hQDVIMKoctZoyCTCnxIYTaornSW7MutjgacYsKQqGo+h55oV2t0GB9l
	 EIRRkfXeJB8vwUXg7iZIGBZteKCB459QNczipql1nXn5I9gAcPa2Kl4X0KMvS0xlBbMK8
	 0VxeZvmU78hGhXg6IoEaoiazQf6WLw1xtEqlyDasLXSMRiwxgzDeJ6ohqPYw+DueuTuD4
	 96Dj/uM6YHaQ8Z+sKKlMSsGHk+g6WA6OvbQMLGCM1RE8sQKYqhEILd+fQ0cOgWpbR/A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793589831;
	h=DMARC-Filter:DKIM-Signature:X-QQ-mid:X-QQ-Originating-IP:Received:
	 X-QQ-SSF:X-QQ-GoodBg:X-BIZMAIL-ID:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:X-QQ-SENDSIZE:Feedback-ID:X-QQ-XMAILINFO:
	 X-QQ-XMRINFO:X-QQ-RECHKSPAM;
	bh=m8op6PwWVPH29KHkSl2bqXfs4ZxwQ7xpDqblCTtVsmw=;
	b=sAS7CKe9/pkths0qY3J617C33Vw64qp5aSn5UWia9NA2uqTMbOTANIjiwxO3/hH7lFTS
	 95EJhiJZevWIOr6liOL1T8kNWe/1qqrbLlZiaYqAKUhP+5+IH1T6CSBNn14QD38IZlQuw
	 Yv09qPk5+/10L2ccPQ01TOIAPiIbOu5DCSahGvhIpnrSIPgwF0K7ktkxnaWLFuEFge3XH
	 wHD39eK7S2M56iB6w282NPVeVhHgZ5oQBvn4qn1sEpadph3a6TICrDVhvPuLIAYdjPZJ5
	 5ocVRKHIzCQKKKYFVv0pNGRQpTqOwffO4z4uABKS15B7EyxAiuJjzYjlAY9rBKYYTdA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=linux.spacemit.com;
	spf=none smtp.mailfrom=linux.spacemit.com;
	dkim=pass header.d=linux.spacemit.com header.i=@linux.spacemit.com header.a=rsa-sha256 header.s=mxsw2412 header.b=c12JYt3D;
	arc=none smtp.remote-ip=54.92.39.34
Received: from smtpbgjp3.qq.com (smtpbgjp3.qq.com [54.92.39.34])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75A95606A326
	for <spacemit@lists.linux.dev>; Mon,  2 Nov 2026 03:23:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 75A95606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux.spacemit.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.spacemit.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.spacemit.com header.i=@linux.spacemit.com header.a=rsa-sha256 header.s=mxsw2412 header.b=c12JYt3D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.spacemit.com;
	s=mxsw2412; t=1793589820;
	bh=m8op6PwWVPH29KHkSl2bqXfs4ZxwQ7xpDqblCTtVsmw=;
	h=MIME-Version:From:Date:Message-ID:Subject:To;
	b=c12JYt3DDDMcSF7OR9jdLUCPR8+1oo4qYF7KVUyDX4Jd6KWQiAiw/fNJTJnPxS1+9
	 5sr4kBU0DbeIE5wb9ZICvRyfDVJPiVfXgizN7KO8TkshnIS33E4gHUWCR2IZyDFc0k
	 0UMDWbrF7JgzWa9tw/vPv13skSPrBEQv1PVzZGi0=
X-QQ-mid: esmtpsz17t1793589816tfe0d6e72
X-QQ-Originating-IP: nvCypPZraZCSTCI4l8W+5Aj8F8LdFZrBe3W2p6nD+A4=
Received: from mail-pl1-f169.google.com ( [209.85.214.169])
	by bizesmtp.qq.com (ESMTP) with SMTP id 0
	for <spacemit@lists.linux.dev>; Mon, 02 Nov 2026 11:23:34 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 3468002119283977713
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-2e8fe8e343fso16579295ad.2
        for <spacemit@lists.linux.dev>; Sun, 01 Nov 2026 19:23:36 -0800 (PST)
X-Forwarded-Encrypted: i=1; AKwUvBx9/JJUbbwZAkVE8quuss5Ox8Zh8dvuLKIV+i12Txp/+1yll4YUW96oPq0IAEWYshsnfcyPo+r2Mw==@lists.linux.dev
X-Gm-Message-State: APuU4Z8j4LrFW45jil4imn4KtdiyVwfWUGmIF3P5MuyL6up05BH4J5wj
	hqTvTi/h/KmrUXCff2pIn6vhxVvSkra8j7x6aw4tbu2Im7wO7zCBWQa2ChkSBz7ifnfpSU7Jpzv
	xguc7GuBVJEMYTATnMPauXxx/iQwF+Mg=
X-Received: by 2002:a17:902:cf08:b0:2e8:b5af:22e0 with SMTP id
 d9443c01a7336-2eb36465f1amr76602555ad.41.1793589814309; Sun, 01 Nov 2026
 19:23:34 -0800 (PST)
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Post: <mailto:spacemit@lists.linux.dev>
List-Help: <mailto:spacemit+help@lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
List-Owner: <mailto:spacemit+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <20261030094024.3226356-1-chunyan.zhang@linux.spacemit.com> <auYxFRtKWbGAlRTL@aurel32.net>
In-Reply-To: <auYxFRtKWbGAlRTL@aurel32.net>
From: Chunyan Zhang <chunyan.zhang@linux.spacemit.com>
Date: Mon, 2 Nov 2026 11:22:58 +0800
X-Gmail-Original-Message-ID: <EBCEB49359C4BBC0+CAAfSe-shesRwmdKhZojqbZjJejVEtA47NXBwNmrpAsTsk6m5rA@mail.gmail.com>
X-Gm-Features: AclHuK9_kWiUHPoaWjYOWVhMFk9nT072XgylDHIVHiujJpZKDNExi2p2MezyEo8
Message-ID: <CAAfSe-shesRwmdKhZojqbZjJejVEtA47NXBwNmrpAsTsk6m5rA@mail.gmail.com>
Subject: Re: [PATCH] riscv: dts: spacemit: k3: add USB3 port A (DRD) nodes
To: Yixun Lan <dlan@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Paul Walmsley <pjw@kernel.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, Aurelien Jarno <aurelien@aurel32.net>
Cc: linux-kernel@vger.kernel.org, spacemit@lists.linux.dev, 
	linux-riscv@lists.infradead.org, Chunyan Zhang <zhang.lyra@gmail.com>, 
	Troy Mitchell <troy.mitchell@linux.spacemit.com>, devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-QQ-SENDSIZE: 520
Feedback-ID: esmtpsz:linux.spacemit.com:qybglogicsvrsz:qybglogicsvrsz3b-0
X-QQ-XMAILINFO: N/DeQfF1kvIMA4KKFTY/lrcTfSCD3YbzRFsQmI+YDRnzi3gpF/VPyJ11
	DZPawgN1zxjbNIy5CQWdHWanB3U7i/HIQuN2XieiSKsX1IXjN78bHJEYJ4Hrrh2w2bzHzoj
	HT3RF3MVOP4tbMa2phrc15B4YN6IXJlEwC8y6cI+eg78OW8u47OvgvAROP7iEl0gys6OKdX
	zOf2QRiDjhCAhCKVZ0PozaQmuwrQLrnoKE8nDCh2NVhVUNAmSgL+r2Vywllq+1YgsTbtM2q
	qFWUyH1Ju3fZWWIrTEtXqvJ5RX40kfN12il5ofHnMbd7oJsj3kzOp1SPFxdoDdKnasg3Pbx
	f6KvWY4OQRks0jTGPx92weQvCbnhZsK5XnlQV7Fc5Q3kCdbTlYScxvADof585WkyNsgWXQX
	KDAN/W4XX+0qYAhMuoNf2soYWdIWUKRnbv0r5GJjMJr9/BXi9AXIj0ZZ9YMgsoN+A1+1saM
	3sAOuyXwcgWdtBBSyt5QukBxnKxzoj8cddStpq1qpStpK4A5qbtmg/zkktHTVLbmf5qX3nY
	lyqJPEnJeM3MEiU2TpshUeBK8WzpHvhmeiiH/aH+CBIGw2XIkIeWzHRG/b9CZflHIp5YAlx
	Qx659EjJv0LBeCjL3i8BNZ4fZ8VWa8pXigminum9xK8mf0ftt3aZlhwCbUMXUW2lOv7k68c
	zx2HOjxI5uYXvYeluchbv1XUKqVuMKq3avZIgTOkK736DQ00eGHktoYC9uDbVz9B1iVai40
	GJxWmBVmTvw0L4g5PT/FNYk44hGW+kdg6/rTX6zuAl9p5aUakejFLFE5JOeq3KsqGGo4GV5
	p0Ap7yRvvR0vr4op8U/qciv495RYG7OKX9qjKztYyqLbsX4Obz2doiWlYK6sWGpKAJD2pPC
	ZBdI4o6cGUJ/O7tgMuJYOZlhhYcwB006RHzeI9LRK5zcF0y2khKa74/PlhZsHMOWt3jKarf
	vPSHzXhkNcdpMAorJZDXJUaC6U9nrz5jf1wknGm+tMzzt5W/hZKd51p+Mf5iIgpOaYJG2U9
	WXcasLx5EIUr5HQdDov8OIi9gfUWYXt8bc9WXoTCl4bcNdq1UOai3T8D9KBN8=
X-QQ-XMRINFO: OD9hHCdaPRBwH5bRRRw8tsiH4UAatJqXfg==
X-QQ-RECHKSPAM: 0

Hi Aurelien,

On Sun, 1 Nov 2026 at 02:19, Aurelien Jarno <aurelien@aurel32.net> wrote:
>
> Hi,
>
> On 2026-10-30 17:40, Chunyan Zhang wrote:
> > Describe the DWC3 controller and its USB 2.0 PHY for USB3 port A
> > of the K3 SoC.
> >
> > Only the U2 lane is described: Port A's SuperSpeed PHY has no driver
> > yet, so the port runs at high-speed (maximum-speed = "high-speed").
> >
> > Enable USB3 port A with dr_mode = "peripheral", so it can be used as
> > a USB device.
> >
> > Signed-off-by: Chunyan Zhang <chunyan.zhang@linux.spacemit.com>
> > ---
> >  arch/riscv/boot/dts/spacemit/k3-pico-itx.dts |  9 ++++++
> >  arch/riscv/boot/dts/spacemit/k3.dtsi         | 30 ++++++++++++++++++++
> >  2 files changed, 39 insertions(+)
> >
> > diff --git a/arch/riscv/boot/dts/spacemit/k3-pico-itx.dts b/arch/riscv/boot/dts/spacemit/k3-pico-itx.dts
> > index b084a35aa00e..74d4fdf9e405 100644
> > --- a/arch/riscv/boot/dts/spacemit/k3-pico-itx.dts
> > +++ b/arch/riscv/boot/dts/spacemit/k3-pico-itx.dts
> > @@ -323,6 +323,15 @@ &usb2_phy {
> >       status = "okay";
> >  };
> >
> > +&usb3a_u2phy {
> > +     status = "okay";
> > +};
> > +
> > +&usb3a {
> > +     dr_mode = "peripheral";
> > +     status = "okay";
> > +};
> > +
> >  &usb3d_u2phy {
> >       status = "okay";
> >  };
> > diff --git a/arch/riscv/boot/dts/spacemit/k3.dtsi b/arch/riscv/boot/dts/spacemit/k3.dtsi
> > index c3f2dce0969c..220dfe29bb78 100644
> > --- a/arch/riscv/boot/dts/spacemit/k3.dtsi
> > +++ b/arch/riscv/boot/dts/spacemit/k3.dtsi
> > @@ -630,6 +630,36 @@ gmac2_axi_setup: stmmac-axi-config {
> >                       };
> >               };
> >
> > +             usb3a: usb@cad00000 {
>
> Please move this after the eth2 node, so that the node addresses are
> kept sorted.
>
> > +                     compatible = "spacemit,k3-dwc3";
> > +                     reg = <0x0 0xcad00000 0x0 0x10000>;
> > +                     interrupts = <118 IRQ_TYPE_LEVEL_HIGH>;
> > +                     interrupt-parent = <&saplic>;
> > +                     clocks = <&syscon_apmu CLK_APMU_USB3_PORTA_BUS>;
> > +                     clock-names = "usbdrd30";
> > +                     resets = <&syscon_apmu RESET_APMU_USB3_A_AHB>,
> > +                              <&syscon_apmu RESET_APMU_USB3_A_VCC>,
> > +                              <&syscon_apmu RESET_APMU_USB3_A_PHY>;
> > +                     reset-names = "ahb", "vcc", "phy";
> > +                     phys = <&usb3a_u2phy>;
> > +                     phy-names = "usb2-phy";
>
> Please move the PHYs definition to the board level, matching was it is
> done for the other USB3 ports, as other boards might have different PHY
> configuration.
>
> > +                     phy_type = "utmi";
> > +                     snps,dis_enblslpm_quirk;
> > +                     snps,dis_u2_susphy_quirk;
> > +                     snps,dis-del-phy-power-chg-quirk;
> > +                     snps,dis-tx-ipgap-linecheck-quirk;
> > +                     maximum-speed = "high-speed";
>
> I think the maximum-speed property should also be moved to the board
> level, as its value depends on the PHYs configuration.

Sure. I will address all the above comments.

>
> > +                     status = "disabled";
> > +             };
>
> Any reason not to define the snps,parkmode-disable-ss-quirk property? It
> is defined for the other USB3 ports, as well as for the USB3 A port in
> the vendor kernel

The original thought was that this property is SS-specific and thus unnecessary
without usb3-phy support. However, since it reflects a hardware characteristic
that applies regardless of the current PHY configuration, adding it makes sense
for consistency and forward compatibility.

>
> > +
> > +             usb3a_u2phy: phy@cad20000 {
> > +                     compatible = "spacemit,k3-usb2-phy";
> > +                     reg = <0x0 0xcad20000 0x0 0x200>;
> > +                     clocks = <&syscon_apmu CLK_APMU_USB3_PORTA_BUS>;
> > +                     #phy-cells = <0>;
> > +                     status = "disabled";
> > +             };
> > +
> >               pdma: dma-controller@d4000000 {
> >                       compatible = "spacemit,k3-pdma";
> >                       reg = <0x0 0xd4000000 0x0 0x4000>;
>
> Otherwise looks good.

Thanks for the review,
Chunyan
