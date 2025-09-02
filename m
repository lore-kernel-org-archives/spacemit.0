Received: from smtpbgau2.qq.com (smtpbgau2.qq.com [54.206.34.216])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E1FB25394A
	for <spacemit@lists.linux.dev>; Tue,  2 Sep 2025 01:38:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=54.206.34.216
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756777086; cv=none; b=WfYXi6yQwmwjoje8sebseZwk9qicHX/nl9TAe2da2W8680QWYSl64Y5OKekFWXCRX9ZQ4kNEBoCW0UXQPO7eVYTQ0hJYwgtzYEh+oD4n5QV8TdmuHVOTX1p2JO0a7ab7tTl85xC4i6EoZ6l/Dt2tGZwB/6dRArpkaCHxRNRugHw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756777086; c=relaxed/simple;
	bh=RdNz+xMghh0j3/4HDoLK3CQoLwuA3tAc1tMSvN5dA0c=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hXduOu0ZGxD9VeLpb85i3zlUmsUXodZ22PrvYWoTCi3fjS/r2frPgeE5hwt4TQ4eD50hH4gr27uXLFBO9qqroEA9pgM1s9FwGC3VgRlC7luW51tLexnz96x07mLYqn1jj7asdBCQPaTSlRXfrmeqHUp3oAfSm/e4Mctbw4eC6zo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux.spacemit.com; spf=none smtp.mailfrom=linux.spacemit.com; dkim=pass (1024-bit key) header.d=linux.spacemit.com header.i=@linux.spacemit.com header.b=Vixr30gj; arc=none smtp.client-ip=54.206.34.216
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux.spacemit.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.spacemit.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.spacemit.com header.i=@linux.spacemit.com header.b="Vixr30gj"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.spacemit.com;
	s=mxsw2412; t=1756777014;
	bh=nuRp5/zQbJKjGxE1cWeR4IjPYVb/g7agSx6QBm8LKbg=;
	h=Date:From:To:Subject:Message-ID:MIME-Version;
	b=Vixr30gjKGG07ECjsjGCb4Rwh0ZDLlhEpWMgOQj+Z+bxW4aVWLrjx4z2O8xfWyxe0
	 dyI5OWnb5i0gQ0xSNXgyTElxnC+RrG7t6gXCAuqYcpK/nHI8JlSW6Z3ih8wiLbZN3v
	 OmG04mPhPib3qbNa4Fd3l6ohmE7w0P7p5fs53eDg=
X-QQ-mid: esmtpgz12t1756777004te7029297
X-QQ-Originating-IP: jhVh9wIS09zFuhXA6omcYkmjiTPVmGhmq1VO4+ZOsYM=
Received: from = ( [14.123.255.17])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Tue, 02 Sep 2025 09:36:42 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 11881375477750079152
EX-QQ-RecipientCnt: 15
Date: Tue, 2 Sep 2025 09:36:42 +0800
From: Troy Mitchell <troy.mitchell@linux.spacemit.com>
To: Rob Herring <robh@kernel.org>,
	Troy Mitchell <troy.mitchell@linux.spacemit.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Yixun Lan <dlan@gentoo.org>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	Philipp Zabel <p.zabel@pengutronix.de>, linux-sound@vger.kernel.org,
	devicetree@vger.kernel.org, linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/2] ASoC: dt-bindings: Add bindings for SpacemiT K1
Message-ID: <B3CE2A46D0298344+aLZKKpVSf2bRx2pb@LT-Guozexi>
References: <20250828-k1-i2s-v2-0-09e7b40f002c@linux.spacemit.com>
 <20250828-k1-i2s-v2-1-09e7b40f002c@linux.spacemit.com>
 <20250829171624.GA1027608-robh@kernel.org>
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250829171624.GA1027608-robh@kernel.org>
X-QQ-SENDSIZE: 520
Feedback-ID: esmtpgz:linux.spacemit.com:qybglogicsvrsz:qybglogicsvrsz3a-0
X-QQ-XMAILINFO: OatzRg8pHEjpa0orEIunAAVH763SGn8t1V1DNIbbtl2J2HxXqy8ZZyLU
	MTY1Cj77XoznZWOhwfU7dwqEwGV0NJE7MLNmT1nxw1kLOb+25lWPexCYB7hLLwVdcotS71g
	gbTtQws0/Fw1o4PJwAzAVlhnp8C419Dn0268ZrYCEYZV8dqmWPOE+Q8oESqwoRhsjofoxXb
	71FXBwhacnNhAfsYi/l6mVc3tTs6Iy8K7dBhXBqV5xIjpVZ/OCibNcjNl2A/j0+VtD8ewnY
	NDi8as/y5XNCZ1TvLey8whHvfj8ieBVDjmFUI0RraIb2KNEXjt6n/5SXF2Trrj2F3vGLjvd
	B7gwk4FDMZziHDE0JtM0tMjiBgTfG2tcG6wvdHmGYxaZ6/45p7pK01hp9aOgzaBBWOvHLVU
	NQWncePo0KOUwURkzMR6LYtrhj4Ph+av+pc3Hu0N1v0YNRhelZQgAqoindwQei15Eji5uSy
	n5Vavcw86Qih6Y7eD8XtK5iNpj5meTo3hp6HfKRTqLeT4EcaYNLdiGqmOVWdr9FwC4p6uU0
	AXAk16otgPlBjaK/ZZvwTmi9MiUH1SY9HgSSBi4tiEVmO3/6/nNzAQTTPnwl75XvFIT6H1g
	AfN9c2IohJNzJfmCxXLl5Nw70KcHZ+Sr0iaHePIT1i8aHAumi+045R8FQZNp33o+srMa6hs
	gC9KDK5NrC0SzwKA1qJgNpHpBrum0JmBlXVqcYBY/2F5mrIZ1vn0cm6FXIjKQ95w2V4gHEt
	w2Tp9xpa0GssgFE821byoDrngweVOvCNn8rYmFXAXWx3atLPMYUiq09pjYWub+vGPfGcumO
	/g6EIkCwumOklNWCVoWGoyeBKovT66X5cLyeV9P01Sz1WsdIk8S/IkffSpJkahNPSx9y8PR
	Ku8bStyNBHU93melLy6ecCo2KIPjySdCSVMLs2i9nWfthWgylX5e0rJRDJSfjLMGU1TXP8h
	Pr1V4bB3owwNR54IbOjY5+RTKlbVxYCYTAT0Qld2JZuaE5/8Wizso3jU5HEpIRped2xHkoF
	sKB7dSbYFiWPkTPf5q
X-QQ-XMRINFO: NS+P29fieYNw95Bth2bWPxk=
X-QQ-RECHKSPAM: 0

On Fri, Aug 29, 2025 at 12:16:24PM -0500, Rob Herring wrote:
> On Thu, Aug 28, 2025 at 11:37:32AM +0800, Troy Mitchell wrote:
> > Add dt-binding for the i2s driver of SpacemiT's K1 SoC.
> > 
> > Signed-off-by: Troy Mitchell <troy.mitchell@linux.spacemit.com>
> > ---
> >  .../devicetree/bindings/sound/spacemit,k1-i2s.yaml | 88 ++++++++++++++++++++++
> >  1 file changed, 88 insertions(+)
> > 
> > diff --git a/Documentation/devicetree/bindings/sound/spacemit,k1-i2s.yaml b/Documentation/devicetree/bindings/sound/spacemit,k1-i2s.yaml
> > new file mode 100644
> > index 0000000000000000000000000000000000000000..042001c38ed8d434889183831e44289ea9c5aef2
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/sound/spacemit,k1-i2s.yaml
[...]
> > +  dmas:
> > +    minItems: 1
> > +    maxItems: 2
> > +
> > +  dma-names:
> > +    oneOf:
> > +      - const: rx
> > +      - items:
> > +          - const: tx
> > +          - const: rx
> 
> If tx is optional, wouldn't this be simpler:
> 
> minItems: 1
> items:
>   - const: rx
>   - const: tx
> 
Thanks! I will simplify this in the next version

                - Troy
> 
> > +
> > +  resets:
> > +    maxItems: 1
> > +
> > +  port:
> > +    $ref: audio-graph-port.yaml#
> > +    unevaluatedProperties: false
> > +
> > +  "#sound-dai-cells":
> > +    const: 0
> > +
> > +required:
> > +  - compatible
> > +  - reg
> > +  - clocks
> > +  - clock-names
> > +  - dmas
> > +  - dma-names
> > +  - resets
> > +  - "#sound-dai-cells"
> > +
> > +unevaluatedProperties: false
> > +
> > +examples:
> > +  - |
> > +    #include <dt-bindings/clock/spacemit,k1-syscon.h>
> > +    i2s@d4026000 {
> > +      compatible = "spacemit,k1-i2s";
> > +      reg = <0xd4026000 0x30>;
> > +      clocks = <&syscon_mpmu CLK_I2S_SYSCLK>,
> > +               <&syscon_mpmu CLK_I2S_BCLK>,
> > +               <&syscon_apbc CLK_SSPA0_BUS>,
> > +               <&syscon_apbc CLK_SSPA0>;
> > +      clock-names = "sysclk", "bclk", "bus", "func";
> > +      dmas = <&pdma0 21>, <&pdma0 22>;
> > +      dma-names = "tx", "rx";
> > +      resets = <&syscon_apbc RESET_SSPA0>;
> > +      #sound-dai-cells = <0>;
> > +    };
> > 
> > -- 
> > 2.50.1
> > 
> 
