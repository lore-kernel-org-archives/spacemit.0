Received: from smtpbgau2.qq.com (smtpbgau2.qq.com [54.206.34.216])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9419226C39E
	for <spacemit@lists.linux.dev>; Tue, 23 Sep 2025 01:33:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=54.206.34.216
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758591225; cv=none; b=p1HPYseRaK1FmceCfZ8aJ0QjR+B0b5NzzBN/K3EmTIGSlM1ekMhTNQvEVtjGyzATJYfIMJM2i7RNaVrNqEiX/bfNsAMSKdpL2Yj4Z5+OdPIE57SP+yqFu2Arg3y2K2RPSsYI08Ra+/HlTwYgAn8gHw0VDathpLVWDZ5jQkxvzxI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758591225; c=relaxed/simple;
	bh=feQ3s2NzA4iM0EEPUY60pGpDIsT+fUHIRpfPtbi14hA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=n1fPx2cKn8VyoeVxgSjy/m34QlYsxDuFgyiLJbZ4/6kyNbjgzD2SrI1gB2j0P84d8g8VYTZN/e9hEX5aKIR9iLK/aua3wGacfHFSch4uI5CKeXoyixNQa0CxsGn8GSlrat4MKBXXN3WGnE8vVDrdanJU/8+YhHQX72n5orYlEpw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux.spacemit.com; spf=none smtp.mailfrom=linux.spacemit.com; dkim=pass (1024-bit key) header.d=linux.spacemit.com header.i=@linux.spacemit.com header.b=opfTQ8oz; arc=none smtp.client-ip=54.206.34.216
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux.spacemit.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.spacemit.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.spacemit.com header.i=@linux.spacemit.com header.b="opfTQ8oz"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.spacemit.com;
	s=mxsw2412; t=1758591132;
	bh=pUgkSqa9MbZmdINZwGXwoPZj1dV53mzsqlI9fZEl9o8=;
	h=Date:From:To:Subject:Message-ID:MIME-Version;
	b=opfTQ8ozNtgZIbtbbZhucEqD6eAgCcNWoPHf6ISD2dw5fuf42wogyPaeb4fsKtXae
	 9DYlFIE1gdXlbooqqW/UQJKm0n7f+bXYN2F3/NwFnyqdXoFU8mpxXkiqmtVvR6hj5N
	 Rv91f5SGm05y6Daf9lTmWGHTxBO9/J62PGvJYAtc=
X-QQ-mid: zesmtpgz8t1758591129tcb5cf986
X-QQ-Originating-IP: Uj8zQ9zH/nwD/Kium59nwlgSkK+cmeq2Gg77IVFAYT0=
Received: from = ( [14.123.255.53])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Tue, 23 Sep 2025 09:32:07 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 9038255662737633468
EX-QQ-RecipientCnt: 14
Date: Tue, 23 Sep 2025 09:32:07 +0800
From: Troy Mitchell <troy.mitchell@linux.spacemit.com>
To: Aurelien Jarno <aurelien@aurel32.net>, linux-kernel@vger.kernel.org,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	Yixun Lan <dlan@gentoo.org>
Cc: "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>,
	"open list:RISC-V ARCHITECTURE" <linux-riscv@lists.infradead.org>,
	"open list:RISC-V SPACEMIT SoC Support" <spacemit@lists.linux.dev>,
	Troy Mitchell <troy.mitchell@linux.spacemit.com>
Subject: Re: [PATCH 1/3] riscv: dts: spacemit: enable the i2c2 adapter on
 BPI-F3
Message-ID: <DC360EB139FD9DE5+aNH4l-7SP5KNu-Br@LT-Guozexi>
References: <20250921210237.943370-1-aurelien@aurel32.net>
 <20250921210237.943370-2-aurelien@aurel32.net>
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250921210237.943370-2-aurelien@aurel32.net>
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpgz:linux.spacemit.com:qybglogicsvrsz:qybglogicsvrsz3a-0
X-QQ-XMAILINFO: NlUc2cqXmL74ZQPbBCZWAnVEChUPmHsEHjg2Unzi/lXHtDpS8kSu/ST3
	0xxcYPmAdbE2DYxFWBt0BL/ejNsQRsOGaMk4o2JkOjmfxFi3DFMCPAR36I6JP/t6qMIYDdE
	G8xqwEElaAfR0VMf3eCeR/4Ajx/UaBPCb6Wjrmlc7cEhbi6HzwxD3eOcMx9OCypIsod5Kra
	WtJh2wkxzOBi1Y4tWkb9h4ARMvQ0Bc9ntx8/uscb2RgiS0HiJDH7fmxEVdfCj7WCLDVsq6z
	Ntw8pAO5XaD3eV8WVx/x41OC79O2k9O41HByp/OpmoEEn84FL4HD2tMOinNdnCiD4ugpZSp
	cEGtCB279+GLlEQV0w3BGE6nQ70FtmSHlnzin9l6YPBIeRaXTRnqPzKwb9ZI/NBaciS44O4
	vr47N55h7tQFn4BFVSO4aSJidlczCadg7a8oTYldYG6zAqBJwmWigeCviR6sECkSQbmRFNe
	LZnczcuPrsB9elWW6jZlG2AWvZRTuvTIJHpUcJJhV4dMIlBcjjDGNwV9aF/oAiQYkHLnyXN
	VjQY5ZsAWH+fhYy80ry25Jk86io76z9XWyVMmJ7nDC9COtHENK/k3j9MCtRkUtHZd9Q/+Su
	3iX5Zo8IsHAN2HUn/1QuAEtiQLk3YKa3M68vRdLMXue9/qnZL5woDUKSsL1ylGE+vkO/fFG
	R16JZ23yZ1FlwjwEMek3abTutaAPilJBV38S+9tD2A2zW+FCIky8BgC/VAy1q+ok3/AU+UT
	l8x2p6co2Iu69ieQCmHmAubi5UZDUgx01alKm9Dw7RSKxR7Hf8YEPe2m8iFHJb6V+TeP5Kl
	QxYqgHFTZF+Bt7gW99H4MceAPwxzyo15TM/2Oa13Ns9jtCC/9DT1yM8OEenNikZKp476SA+
	j3Mfx89Fxe5ieqOPedGZkn8SmdHptzZm4A/HJm4n62MQOc3FnWjCSZlb7HkR+VQMLmJaM/T
	MMExj6H3qRh4Qq8+PNico/BUa5e+QCSS/p+45a+OnbGYQ82xQIqJP8zK2abWxQXh7L4CL2v
	SyArUxRN7YDFVu8XLMyIwKC6YUi6ToDwjqXGeIMbUcSP+wyGMYOp4zkH9uMemO9YOrEjdYa
	4o8a6FMjDXxN65DyoKAyRM=
X-QQ-XMRINFO: Nq+8W0+stu50PRdwbJxPCL0=
X-QQ-RECHKSPAM: 0

On Sun, Sep 21, 2025 at 11:01:41PM +0200, Aurelien Jarno wrote:
> Define properties for the I2C adapter, and enable it on the BPI-F3. It
> will be used by the 24c02 eeprom.
> 
> Signed-off-by: Aurelien Jarno <aurelien@aurel32.net>
> ---
> --- a/arch/riscv/boot/dts/spacemit/k1-pinctrl.dtsi
> +++ b/arch/riscv/boot/dts/spacemit/k1-pinctrl.dtsi
> @@ -92,6 +92,13 @@ gmac1-pins {
>  		};
>  	};
>  
> +	i2c2_0_cfg: i2c2-0-cfg {
Should this be i2c2_4_cfg here?
From what I see, in the initial version the second cell was meant
to be the function number rather than the serial index.

It looks like the pwm part is also incorrect.

                - Troy
> +		i2c2-0-pins {
> +			pinmux = <K1_PADCONF(84, 4)>,	/* I2C2_SCL */
> +				 <K1_PADCONF(85, 4)>;	/* I2C2_SDA */
> +		};
> +	};
> +
>  	i2c8_cfg: i2c8-cfg {
>  		i2c8-0-pins {
>  			pinmux = <K1_PADCONF(93, 0)>,	/* PWR_SCL */
> diff --git a/arch/riscv/boot/dts/spacemit/k1.dtsi b/arch/riscv/boot/dts/spacemit/k1.dtsi
> index bc61a380baca8..d4f38ded52c93 100644
> --- a/arch/riscv/boot/dts/spacemit/k1.dtsi
> +++ b/arch/riscv/boot/dts/spacemit/k1.dtsi
> @@ -497,6 +497,19 @@ pwm7: pwm@d401bc00 {
>  			status = "disabled";
>  		};
>  
> +		i2c2: i2c@d4012000 {
> +			compatible = "spacemit,k1-i2c";
> +			reg = <0x0 0xd4012000 0x0 0x38>;
> +			#address-cells = <1>;
> +			#size-cells = <0>;
> +			clocks = <&syscon_apbc CLK_TWSI2>,
> +				 <&syscon_apbc CLK_TWSI2_BUS>;
> +			clock-names = "func", "bus";
> +			clock-frequency = <400000>;
> +			interrupts = <38>;
> +			status = "disabled";
> +		};
> +
>  		i2c8: i2c@d401d800 {
>  			compatible = "spacemit,k1-i2c";
>  			reg = <0x0 0xd401d800 0x0 0x38>;
> -- 
> 2.47.2
> 
> 
> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv
