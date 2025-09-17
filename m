Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4561526D4F6
	for <spacemit@lists.linux.dev>; Wed, 17 Sep 2025 06:39:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758091158; cv=none; b=fXIBsHyk6RZu0dypxUZGPjwnn8CkXx7+4MdrZl/k2Q/c8lpSIMVYE781ka4HjGDa+hiNyPQV7wqzdjAU5fByKdZcg4uLTmI53cth6JwN4jI/sdNvsfyzJOpKCCRwfAPANqhgeCeE2vxPhMh3CkMITJC5uxMKBncCvv8TILlaedo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758091158; c=relaxed/simple;
	bh=xX+N/SN6MUaa28wK4TLjv1haNtZLkkAoQ0rN+SnsVF8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Fvz2XD0pSRnZwwVJDVSDGxzPRT8/Lr2PvbcTSM4PmjaPge5zlcx5o2FygZe8+YLpvmZXu/tB2cya0h3TMKalcZf0+tQOyoBLAl+/ifupmR2dhn0KIkysv68QfIFEjuERVUXx1mbqCK17S5zvDyQmc23JOJKQAqw51u7qT4y7h+Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=hammernet.be; spf=fail smtp.mailfrom=hammernet.be; dkim=pass (2048-bit key) header.d=hammernet-be.20230601.gappssmtp.com header.i=@hammernet-be.20230601.gappssmtp.com header.b=Qv1lsOhL; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=hammernet.be
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=hammernet.be
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=hammernet-be.20230601.gappssmtp.com header.i=@hammernet-be.20230601.gappssmtp.com header.b="Qv1lsOhL"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-45f29dd8490so32692765e9.1
        for <spacemit@lists.linux.dev>; Tue, 16 Sep 2025 23:39:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=hammernet-be.20230601.gappssmtp.com; s=20230601; t=1758091152; x=1758695952; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=77F0eh5zIcs6VOlyvrc/5uKyRtamVm6y2K0LLyVNiHg=;
        b=Qv1lsOhL1A2iBvdjBW8NuwaGsuvYM5lkgrvoZx8y0vp1/v92qp/BE4R73dS5Tyy4iN
         x3wWX3gaIrZiCONeIIWyUxXDGx4YnKakKNW5U+ZL2YN8UkZ9GRHBgO6bHzfPU3We24O/
         3339FItIF/b7RBdBliPQeRMqdZfxtHo6hwGHgLWZQOLeZ764AJVM5QzZkuVvZeGyaAe6
         IFBUDAsVBiAQXrTbPWNw61n4TXI2TYXoNcNCpF6UZPp7kJEHKWnRnHmtfgD1+z5WLISM
         LULM3JMD7X6eU/U7+GB2CHQ1IaxfWNG9vd5SaC5U9+8DzG3XmpJECDcnR9UP46sRSFmr
         /bEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758091152; x=1758695952;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=77F0eh5zIcs6VOlyvrc/5uKyRtamVm6y2K0LLyVNiHg=;
        b=HZ48UoI/0RTDUmp/WQ6Vu8yJbilUdr9WRe20D+O5TYNRPzWzQiL+G8cTqfq8KZgyq3
         hK7aSJsynuR51mehpUgUNzmVsxFiJF4CvX2/bel2US2gwPxJKx0RPYSieTv4Q8UYxClu
         UmINk+mM18Vanc0LU1L+iuZXQPDd9pCw9MycisN1LJhNtu4w5Uf1Lr6eq1PGfVEXwPKh
         5u9Ntwv93EvlZrG1TS/TZQiIxSltL2Tb+S0F8PyT9E5AueLo3T5fPDiZ5iJTI8gVpMBC
         gykjpFbzHYtzn4mWrJMLeH9j98Z/Jtgs7yRvcmG2eWjFcvHmZqS9Txq4TQHmeIAC1foL
         cQlg==
X-Forwarded-Encrypted: i=1; AJvYcCXDqqn2Cc6Ed+Sh0adL8O7I6taBhzDh+Dq4hJJSXi7Nzvt5VXQU6epLMzSTtwSKkE1QXoBhZz47bA==@lists.linux.dev
X-Gm-Message-State: AOJu0Yx24uTx608KCcAQbfrJIyOvlWIV3H4tx3olsWsGwjrvvjf+DtqW
	jbcTqVq6zy9TTS57E4jOdfn7u0TFXpCe9gx3ud6rmIF7E63vxiw2nMb+JjKCjqn6Itc=
X-Gm-Gg: ASbGncvkd7uexeZsBRcZdB4YuZYbpSntLWx0UVrNPtcl1zu/f+tjK6EqeB3S6fjWimH
	XGImzJWKOCRCIYoCMSSNcvDeUqc2X8FvNod1AuQ8zDn8CAEEqqvG1JNnvvSpDUIdwo2RPGViguQ
	8ln7qetD+P6rEOR0y7s5CnuoY1QBnDjon+h3zfsYCV5RVx3CF81hTp9UzxgJXO4/GIiEEP+qkx9
	/ys87tEbLuFs0xsq89GsKXfsU7oFMk4Xua09fxhvl/zE8BWZDFDsndxQ3zYF3sUpsyuEIbKIWG3
	hqqbbdrbW8TPUhxFscQQDfqKzUXvL3LzDIgmKVXoCTRHHv58RXe76SvPsvSpd7QxGoAuvq8KY2x
	fQ5Hoa6HAOcfSeU4x07WrGVwoyEWrT74TgqA9kowNagKT8hgrWdWLuRjI1gQM5rxE7JMKucdc1X
	U3FDgAkpSvVPbhPA==
X-Google-Smtp-Source: AGHT+IG6Qsc5VU9s+KLN/ObymCbaRcvmgFQYQp7jQl2dFNfoKqhHY6bNfm9aOpDZbu6Xlk5fJjmiww==
X-Received: by 2002:adf:a2d6:0:b0:3e9:d54:19a0 with SMTP id ffacd0b85a97d-3ecdfa4239cmr495573f8f.57.1758091151984;
        Tue, 16 Sep 2025 23:39:11 -0700 (PDT)
Received: from ?IPV6:2a02:1807:2a00:3400:1b1a:e580:5909:925c? ([2a02:1807:2a00:3400:1b1a:e580:5909:925c])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3ecdbc7fe1bsm3414155f8f.52.2025.09.16.23.39.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 16 Sep 2025 23:39:11 -0700 (PDT)
Message-ID: <55237b5d-c9b8-4606-8b5d-c7a97218c085@hammernet.be>
Date: Wed, 17 Sep 2025 08:39:10 +0200
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] riscv: dts: spacemit: add UART pinctrl combinations
To: Yixun Lan <dlan@gentoo.org>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu,
 alex@ghiti.fr, skhan@linuxfoundation.org,
 linux-kernel-mentees@lists.linux.dev, devicetree@vger.kernel.org,
 linux-riscv@lists.infradead.org, spacemit@lists.linux.dev,
 linux-kernel@vger.kernel.org
References: <20250916064739.196695-1-hendrik.hamerlinck@hammernet.be>
 <20250917012941-GYA1263349@gentoo.org>
Content-Language: en-US
From: Hendrik Hamerlinck <hendrik.hamerlinck@hammernet.be>
In-Reply-To: <20250917012941-GYA1263349@gentoo.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hello Yixun,

On 9/17/25 03:29, Yixun Lan wrote:
> Hi Hendrik,
>
> On 08:47 Tue 16 Sep     , Hendrik Hamerlinck wrote:
>> Add UART pinctrl configurations based on the SoC datasheet and the
>> downstream Bianbu Linux tree. The drive strength values were taken from
>> the downstream implementation, which uses medium drive strength.
>> CTS/RTS are moved to separate *-cts-rts-cfg states so boards can enable
>> hardware flow control conditionally.
>>
>> Signed-off-by: Hendrik Hamerlinck <hendrik.hamerlinck@hammernet.be>
>> ---
>> Changes in v3:
>> - Added /omit-if-no-ref/ to pinctrl states to reduce DT size
>>
>> Changes in v2:
>> - Split cts/rts into separate pinctrl configs as suggested
>> - Removed options from board DTS files to keep them cleaner
>> ---
>>  arch/riscv/boot/dts/spacemit/k1-pinctrl.dtsi | 432 ++++++++++++++++++-
>>  1 file changed, 429 insertions(+), 3 deletions(-)
>>
>> diff --git a/arch/riscv/boot/dts/spacemit/k1-pinctrl.dtsi b/arch/riscv/boot/dts/spacemit/k1-pinctrl.dtsi
>> index 381055737422..7811fb485bd4 100644
>> --- a/arch/riscv/boot/dts/spacemit/k1-pinctrl.dtsi
>> +++ b/arch/riscv/boot/dts/spacemit/k1-pinctrl.dtsi
>> @@ -11,12 +11,438 @@
>>  #define K1_GPIO(x)	(x / 32) (x % 32)
>>  
>>  &pinctrl {
>> +	/omit-if-no-ref/
>> +	uart0_0_cfg: uart0-0-cfg {
>> +		uart0-0-pins {
>> +			pinmux = <K1_PADCONF(104, 3)>,	/* uart0_txd */
>> +				 <K1_PADCONF(105, 3)>;	/* uart0_rxd */
>> +			power-source = <3300>;
>> +			bias-pull-up;
>> +			drive-strength = <19>;
>> +		};
>> +	};
>> +
>> +	/omit-if-no-ref/
>> +	uart0_1_cfg: uart0-1-cfg {
>> +		uart0-1-pins {
>> +			pinmux = <K1_PADCONF(108, 1)>,	/* uart0_txd */
>> +				 <K1_PADCONF(80, 3)>;	/* uart0_rxd */
>> +			power-source = <3300>;
> ..
>> +			bias-pull-up;
> here, see comment below
>> +			drive-strength = <19>;
>> +		};
>> +	};
>> +
>> +	/omit-if-no-ref/
>>  	uart0_2_cfg: uart0-2-cfg {
>>  		uart0-2-pins {
>> -			pinmux = <K1_PADCONF(68, 2)>,
>> -				 <K1_PADCONF(69, 2)>;
>> +			pinmux = <K1_PADCONF(68, 2)>,	/* uart0_txd */
>> +				 <K1_PADCONF(69, 2)>;	/* uart0_rxd */
>> +			bias-pull-up;
>> +			drive-strength = <32>;
>> +		};
>> +	};
>>  
>> -			bias-pull-up = <0>;
> Sorry, I've overlooked this, the bias-pull-up need to explicitly set to
> a vale of 0, 1 - normal pull up, or strong pull up.. for uart, the normal
> pull up should be ok
>
> please refer Documentation/devicetree/bindings/pinctrl/spacemit,k1-pinctrl.yaml
>
> Since the rc6 is already tagged, I'm about to prepare a PR, so If you able 
> to respin a new version quickly, I'd be happy to take, otherwise let's wait
> for next merge window (which shouldn't be a big problem)
>
> btw, please always do a DT check: 
>   make ARCH=riscv dtbs_check W=1
>
Oh, I wasn’t aware of this. I’ll update it accordingly and run the check
before sending a new version. Thanks for the advice!

Kind regards,
Hendrik

