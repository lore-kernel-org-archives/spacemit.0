Received: from smtpbgeu2.qq.com (smtpbgeu2.qq.com [18.194.254.142])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 432B923FC54
	for <spacemit@lists.linux.dev>; Sat, 16 Aug 2025 09:15:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=18.194.254.142
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755335721; cv=none; b=cgbgRi7bpzybAfPs7kFERRlNOL/OO2DrQoZVAbFzYP4jkdqX1ZtJoT0KQ2CuHUzzaGHM6KsFiu9f/u5vtrsUKXTwcSO/qRE3NAShQi7DEe806LQCzRrkJAm67alMuzPC+gM4fPzyx0cq0lHtEg2Jzwsoen1iU5UbuMjRW9C0gaw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755335721; c=relaxed/simple;
	bh=ZdKnQYRuR3HrfaBPrfJ2dVRybAc1Vk+EPmW79NieZ/U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pQt+XAPr54f+p19mOovuC3faOVEZE6dQ3pIfpSWNA5lVCI7gFTIyx/g2jkF5NBcV8il1fOOqjbmhb4+u3cWrfC8LQoYpUP9MM5vJ3SqjWyVZBn4FrSLrT+4YIlFJIh3m9+mK1FKcil3GB93n0drJ+oBf/rjelXAVApDvJFwg0+c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux.spacemit.com; spf=none smtp.mailfrom=linux.spacemit.com; dkim=pass (1024-bit key) header.d=linux.spacemit.com header.i=@linux.spacemit.com header.b=RjmnY+qK; arc=none smtp.client-ip=18.194.254.142
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux.spacemit.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.spacemit.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.spacemit.com header.i=@linux.spacemit.com header.b="RjmnY+qK"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.spacemit.com;
	s=mxsw2412; t=1755335633;
	bh=hbXtoR3uWxiKczQIaq//GQkhVV7HPaIDh8JT8/clkDc=;
	h=Date:From:To:Subject:Message-ID:MIME-Version;
	b=RjmnY+qKhskPZWZ5Zsut6+u4UJaKdbiGEguukpdKyqdGgk0lCSBi1Z2PVeqVZCLsY
	 kp/rmwD+2Ct+3r7hTi7d6gqLC2fUhqBdkSD/81cEkNAqFoun31u28gw8AafHMx+Kpd
	 Er3ma36QXXyC6PpNl863OcM1qzxHB6srVJiStI1M=
X-QQ-mid: zesmtpip3t1755335624tdfc22a4d
X-QQ-Originating-IP: q1QVFsw6Qn/8GxGPXxJhBWdr66tYEr9pdlAVtNoZFY4=
Received: from = ( [localhost])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Sat, 16 Aug 2025 17:13:43 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 8634151311153834424
EX-QQ-RecipientCnt: 15
Date: Sat, 16 Aug 2025 17:13:42 +0800
From: Troy Mitchell <troy.mitchell@linux.spacemit.com>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Yixun Lan <dlan@gentoo.org>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	Philipp Zabel <p.zabel@pengutronix.de>
Cc: linux-sound@vger.kernel.org, devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org, spacemit@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Troy Mitchell <troy.mitchell@linux.spacemit.com>
Subject: Re: [PATCH 1/2] dt-bindings: i2s: spacemit: add support for K1 SoC
Message-ID: <67A5AD581BFFAEE1+aKBLxuQLDlf3JFVN@troy-wujie14pro-arch>
References: <20250814-k1-i2s-v1-0-c31149b29041@linux.spacemit.com>
 <20250814-k1-i2s-v1-1-c31149b29041@linux.spacemit.com>
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250814-k1-i2s-v1-1-c31149b29041@linux.spacemit.com>
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpip:linux.spacemit.com:qybglogicsvrsz:qybglogicsvrsz3a-0
X-QQ-XMAILINFO: N2K7JO7TcIoEo4bQxstuthcJ3EFVDSMsD2PXtUIgj+oyG/rf2T7WhXG2
	+JbrkAp4th8UQjTe+VgZBAo2d3Gq01j5ZRXRmITGIzF3eHeI5x7OFQRei+VOW+TCS2cJuZE
	N3wkpZ4lulCzowpjAkqKqHfIlfXaGr9ZFV2QvXVsiVQ921yokON1HNKEDIPu60f3OkoNV/Z
	kTA9Z3B3S/d7Es7vbg8BNpUxpdTxQkrYJ3G3CEfx4tzNsB2JgLE0QO6lRQ9Iusw9sKihdVH
	cSzRSyPEpdx3RpvNhG4X7bN/IN6g2+dU5L7QLaXRU4PIGXILD8OBuMKJEONDw5c/LRE7efq
	iSHvLIg2Uy/QUkjqawGYN1gXfariCcKDWyHHh0G1h3y/wdIAL9tLu2tBTQMp1YvOkjOcRrs
	oXnN4TZK77QUIrpk4LQ0szidPbKnjKyhKtVs2INYqIx56EKoNy8CgfOB1+/xYbPDAAXb+oX
	K+yHOhqPdFUOYOfaDKQGfVvxHUi60QYBscqBn92JVcqbl8H7lxlCQF5TRTAUAeqhcENHII4
	n0l19gZTgZcCNcfuO9sN0IvNN4GgUp5lWD8QfR7jiEOZ935Z92hY+eXFLUOmnudNHqaJZJw
	hHQOO2Pt32CQAgQf2nTPnz1uuBiuJtuNfkMGF8rL+sI1LrDoSv48MpzQ9Cp3Avjbwjd7YRE
	tGe6XG/alL89kViLJElu/2SbLN54gm/otd49TkSz35a5L6LFr8JJovgWOYOoHq6cF0kGAvE
	p8Cji8rgoKpSoY6cR9bJC+XAHflcuqUVzoxl7SROzMnzgQeZEVZ0QY8YhfRZZXlSuyw/pxZ
	pgu5EoLnnDbjzMr89QafKWuh4r1B8kFvXw2c7C3hOVwWS/KF85llfNRzZo2hyPA6C0Nl3PE
	LINHePKaWk1obi3pyD/mOWLEsiVwS0IHqWrsR1usDDm+4hE/obnzUXOhWXBaiUu/qkGq6f4
	j0Nl5+oXFUbbcjYJtJ8C9J52DoUqsnMhyiJPJ9G4qhozyk6QICA8kGhHDy+u9k2hr/s79mI
	Z4LgDVB/2Q0WFc32lqeny0GiRCpCTgKlll33Oz8ETr3qKO6AizNfZkMFOPOtM=
X-QQ-XMRINFO: OD9hHCdaPRBwq3WW+NvGbIU=
X-QQ-RECHKSPAM: 0

On Thu, Aug 14, 2025 at 04:54:19PM +0800, Troy Mitchell wrote:
> Add dt-binding for the i2s driver of SpacemiT's K1 SoC.
> 
> Signed-off-by: Troy Mitchell <troy.mitchell@linux.spacemit.com>
> ---
>  .../devicetree/bindings/sound/spacemit,k1-i2s.yaml | 88 ++++++++++++++++++++++
>  1 file changed, 88 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/sound/spacemit,k1-i2s.yaml b/Documentation/devicetree/bindings/sound/spacemit,k1-i2s.yaml
> new file mode 100644
> index 0000000000000000000000000000000000000000..7d9110638d71792db6e5bb72559f6abaf4cb59bb
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/sound/spacemit,k1-i2s.yaml
> @@ -0,0 +1,88 @@
> +# SPDX-License-Identifier: GPL-2.0
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/sound/spacemit,k1-i2s.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: K1 I2S controller
> +
> +description:
> +  The I2S bus (Inter-IC sound bus) is a serial link for digital
> +  audio data transfer between devices in the system.
> +
> +maintainers:
> +  - Troy Mitchell <troy.mitchell@linux.spacemit.com>
> +
> +allOf:
> +  - $ref: dai-common.yaml#
> +
> +properties:
> +  compatible:
> +    const: spacemit,k1-i2s
> +
> +  reg:
> +    maxItems: 1
> +
> +  clocks:
> +    items:
> +      - description: clock for I2S sysclk
> +      - description: clock for I2S bclk
> +      - description: clock for I2S bus
> +      - description: clock for I2S controller
> +
> +  clock-names:
> +    items:
> +      - const: sysclk
> +      - const: bclk
> +      - const: bus
> +      - const: func
> +
> +  dmas:
> +    minItems: 1
> +    maxItems: 2
> +
> +  dma-names:
> +    oneOf:
> +      - const: rx
> +      - items:
> +          - const: tx
> +          - const: rx
> +
> +  resets:
> +    maxItems: 1
> +
> +  port:
> +    $ref: audio-graph-port.yaml#
> +    unevaluatedProperties: false
> +
> +  "#sound-dai-cells":
> +    const: 0
> +
> +required:
> +  - compatible
> +  - reg
> +  - clocks
> +  - clock-names
> +  - dmas
> +  - dma-names
> +  - resets
> +  - "#sound-dai-cells"
> +
> +unevaluatedProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/clock/spacemit,k1-syscon.h>
> +    i2s@d4026000 {
> +      compatible = "spacemit,k1-i2s";
> +      reg = <0xd4026000 0x30>;
> +      clocks = <&syscon_mpmu CLK_I2S_SYSCLK>,
> +               <&syscon_mpmu CLK_I2S_BCLK>,
> +               <&syscon_apbc CLK_SSPA0_BUS>,
> +               <&syscon_apbc CLK_SSPA0>;
> +      clock-names = "sysclk", "bclk", "bus", "func";
> +      dmas = <&pdma0 21 1>, <&pdma0 22 1>;
I'll keep to 1 cell in the next version.

> +      dma-names = "tx", "rx";
> +      resets = <&syscon_apbc RESET_SSPA0>;
> +      #sound-dai-cells = <0>;
> +    };
> 
> -- 
> 2.50.1
> 
