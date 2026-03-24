Received: from smtpbgeu2.qq.com (smtpbgeu2.qq.com [18.194.254.142])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BF843932D8
	for <spacemit@lists.linux.dev>; Tue, 24 Mar 2026 08:44:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=18.194.254.142
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774341891; cv=none; b=FycIYImv709V5BqfD9/OfR52rlu8tSoVcivS/7m5hXw3MS6B4VIf3eG56zwXpNYcdpq4XO/21SX+i15vswGc6VHVdirXldhwSrXDmXAtwX7sTmp5nX0HvD3IOmPIrXMvteurm7MAl+m3W+cxRw+A1Ff93JuO0kKR4O90dGnP0tE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774341891; c=relaxed/simple;
	bh=Ms3RGmo9BXjWfapShY57qDrtGqMLyG3DfhKTMFqIWls=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=EJEIGAYujrDwmlEg2NFW8EEJFmG7S7HuyMnSBdeAziQQoiWlLLPDKJq0tWlV397Ensy9+HfCq9txFRpkvNJaFv9i26mAM01R82FxdHV4IuwFj0YmsekyRv96KauFgxWp9IGdCi8y5TzleDZ2FRHGGS3ad4SO39RffySdj1rTNOY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux.spacemit.com; spf=none smtp.mailfrom=linux.spacemit.com; dkim=pass (1024-bit key) header.d=linux.spacemit.com header.i=@linux.spacemit.com header.b=qdYg+cTZ; arc=none smtp.client-ip=18.194.254.142
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux.spacemit.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.spacemit.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.spacemit.com header.i=@linux.spacemit.com header.b="qdYg+cTZ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.spacemit.com;
	s=mxsw2412; t=1774341812;
	bh=0YvANwo0IIKUqL+qEoGQdaKoDGB4cYehMUWEEPhPQKA=;
	h=Mime-Version:Date:Message-Id:Subject:From:To;
	b=qdYg+cTZcdJp80mbc+BukO97/LQ3trjlCj4lJ9g8uOCO7C0qCWBzqW8ldTYea5nUV
	 vHdhhrxclvMW3C9SJCLLH847im6eGMtq8aq0q/YfF4LAGFDknoc6ZchGDSNf0b25SA
	 hywzihie2nWJA5eIcpzXLbYFRAsbaUsqd+KuMzWU=
X-QQ-mid: esmtpgz10t1774341810te82cbcf8
X-QQ-Originating-IP: Tkqsk5ZBeYEfXLsi7Obys+UNNLFSDV+KwfMkR4d5z8M=
Received: from = ( [120.237.158.181])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Tue, 24 Mar 2026 16:43:28 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 3668339084073543840
EX-QQ-RecipientCnt: 13
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 24 Mar 2026 16:43:28 +0800
Message-Id: <DHAVODVZL2KG.1NVQFF3B99WV8@linux.spacemit.com>
Cc: "Rob Herring" <robh@kernel.org>, "Krzysztof Kozlowski"
 <krzk+dt@kernel.org>, "Conor Dooley" <conor+dt@kernel.org>, "Paul Walmsley"
 <pjw@kernel.org>, "Palmer Dabbelt" <palmer@dabbelt.com>, "Albert Ou"
 <aou@eecs.berkeley.edu>, "Alexandre Ghiti" <alex@ghiti.fr>,
 <devicetree@vger.kernel.org>, <linux-riscv@lists.infradead.org>,
 <spacemit@lists.linux.dev>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] riscv: dts: spacemit: Add PDMA controller node for K3
 SoC
From: "Troy Mitchell" <troy.mitchell@linux.spacemit.com>
To: "Yixun Lan" <dlan@kernel.org>, "Troy Mitchell"
 <troy.mitchell@linux.spacemit.com>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20260317-k3-pdma-v1-1-f39d3e97b53a@linux.spacemit.com>
 <20260320091936-GKB525649@kernel.org>
In-Reply-To: <20260320091936-GKB525649@kernel.org>
X-QQ-SENDSIZE: 520
Feedback-ID: esmtpgz:linux.spacemit.com:qybglogicsvrgz:qybglogicsvrgz3a-0
X-QQ-XMAILINFO: N8Jy6PtD39R8Dfa0ZQzLpgo9QpuWadc0Vlouiu/MVjGBJJr9yT5bfYm/
	43KNO2cwgzmIYbwsCFR9OwLFC+uGErtLjnL/EjO53LsgzfnV6NuW3jnBtdZ4r0bUdJbs7JF
	XFvzDBZ85yfeE1NEe1z/0K++X3Cr4V5YkLGQAtCbOwMSJ4/PZqUdI2WZuT0GmkRfRLiNfuO
	9yb6t1ei/Bv3/xe7pzOmpIkt0nYW0EewxeCPRhQVq2zRocXaPg0rG/YhXvay1c2JSyZ6HSi
	Uy4fKqAuhlCGy3ad35M1UbGXlDxPHSPgeGeyKs1bbTpeIHbCZLTQbx7kR3Y1RIX6NNIyCLD
	qwxlvMhM045VcFuYKtrJ4pDCkVIQj9XyJoE3CZeNmzOawZAtlKBmgiwivtSwOCv6TA1zUAG
	lE0CwbHlojRErxEVme0sRU9IQLZZJpCbemNngd1r15mAkXLxM1LEy8dnqTVApuHSue4xWX6
	Prs1vQBsDud5ed7HIW8/QfDoOE8BJyyol1NtC6yB+bN0RrbO0P7315mRdNxtbPBBO2H6GND
	VxJarxuigEs5AjKHJoQHZszhd9OyrU9FdZFldancUhO1UVsUOQpg5lXST/8XBol1QRLtw3a
	DdXCaM74iQfvnIDWMzVak+qmqMTBaejsisPw0QBrUIZuF7k3kAaNEArMtWcUXyDXO+Nx6QB
	kZZDqSQkeIsJs4YYciRzMyY6MVHH4QKGHX7Q2pr2KFHuuuRoJp0r9iwEK7PwjkL2s0C0TRI
	7XfOu+G9LuL4Wr7SWCXRrMeSRACOl3e6Fyid57of5Vgb86dH31ooR0+YL9cfkFvqngftoXm
	YZdF9/QIS/lTUY84LVlVOxTHQUkIYuG4iGDOP9ssnRJ2yi/260Ic4eX9qFIjW4l1X/H097R
	2RVaMprowMX1dFikOlYPZmLF6g/C2Hkmy9VgWju9B4vLs0FBUPMqe+81uD1GXlElDlNeHr5
	QhvE7RFtkIHziGFy4DuweflRNteL+hM7nR6aibuLrSenfIVEcJmT3iJwAx2GbYE9/hAjEj4
	IIAAj2T1EEa3rjoQ7uZTclmSwufm97+aX/IkjjgLsLgetOGIqR
X-QQ-XMRINFO: OD9hHCdaPRBwH5bRRRw8tsiH4UAatJqXfg==
X-QQ-RECHKSPAM: 0

On Fri Mar 20, 2026 at 5:19 PM CST, Yixun Lan wrote:
> Hi Troy,
>
> On 15:55 Tue 17 Mar     , Troy Mitchell wrote:
>> Add the Peripheral DMA (PDMA) controller node for the SpacemiT K3 SoC.
>> The PDMA controller provides general-purpose DMA capabilities for variou=
s
>> peripheral devices across the system to offload CPU data transfers.
>>=20
>> Unlike the previous K1 SoC, where some DMA masters had memory addressing
>> limitations (e.g. restricted to the 0-4GB space) requiring a dedicated d=
ma-bus
>> with dma-ranges to restrict memory allocations, the K3 DMA masters have
>> full memory addressing capabilities. Therefore, the PDMA node is now
>> instantiated directly under the main soc bus.
>>=20
> ..
>> This configuration defines the essential hardware properties:
>> - Register base address and size
>> - High-level triggered interrupt
>> - Associated APMU clock and reset controls
>> - 16 hardware DMA channels
>>=20
>> The node is disabled by default and should be enabled by specific
>> board device trees as needed.
> I would suggest to drop above, as they are quite obvious, and easy for=20
> people to grab from the code..
I'll remove them in the next version.
>>=20
>> Signed-off-by: Troy Mitchell <troy.mitchell@linux.spacemit.com>
>> ---
>>  arch/riscv/boot/dts/spacemit/k3.dtsi | 11 +++++++++++
>>  1 file changed, 11 insertions(+)
>>=20
>> diff --git a/arch/riscv/boot/dts/spacemit/k3.dtsi b/arch/riscv/boot/dts/=
spacemit/k3.dtsi
>> index a3a8ceddabec..f90d34a81be0 100644
>> --- a/arch/riscv/boot/dts/spacemit/k3.dtsi
>> +++ b/arch/riscv/boot/dts/spacemit/k3.dtsi
>> @@ -438,6 +438,17 @@ soc: soc {
>>  		dma-noncoherent;
>>  		ranges;
>> =20
>> +		pdma: dma-controller@d4000000 {
>> +			compatible =3D "spacemit,k1-pdma";
> I think here we should introduce a new compatible for K3 SoC,
> it would avoid ABI breakage if something different with K1?
> cases exist even same PDMA IP integrated into different SoC..
>
> The commit message tells some difference, although no code changes
> introduced so far..
Nice point.

                            - Troy
>
>> +			reg =3D <0x0 0xd4000000 0x0 0x4000>;
>> +			clocks =3D <&syscon_apmu CLK_APMU_DMA>;
>> +			resets =3D <&syscon_apmu RESET_APMU_DMA>;
>> +			interrupts =3D <72 IRQ_TYPE_LEVEL_HIGH>;
>> +			dma-channels =3D <16>;
>> +			#dma-cells =3D <1>;
>> +			status =3D "disabled";
>> +		};
>> +
>>  		syscon_apbc: system-controller@d4015000 {
>>  			compatible =3D "spacemit,k3-syscon-apbc";
>>  			reg =3D <0x0 0xd4015000 0x0 0x1000>;
>>=20
>> ---
>> base-commit: 95c541ddfb0815a0ea8477af778bb13bb075079a
>> change-id: 20260317-k3-pdma-7c1734431436
>>=20
>> Best regards,
>> --=20
>> Troy Mitchell <troy.mitchell@linux.spacemit.com>
>>=20

