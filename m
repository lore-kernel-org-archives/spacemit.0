Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E41AB326D50
	for <spacemit@lists.linux.dev>; Mon, 15 Sep 2025 14:26:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757946422; cv=none; b=AbAsoA3cREhOsWhcbnHNHopcgjGc05EvpY/n11FxokZNzG15I5jgSV3fbsMdq4u5v6DPKee0oU0s3cJureKUNE/2t6lbItkGQMZq3o2NO5boF2QKkpBdU0cxdA+WVAUp80vMj65PR76SVyIVms/D1X/0eURcHuosF3VLJqsCpkc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757946422; c=relaxed/simple;
	bh=B9iBG3o70JLtS2vZWkvI2+9FPF/4l8skzLqAxOuWZ18=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Mr0WicXxP3yfq+Wtdqk5m0vyLvWhenvt7dh/MQ0Ei++5n4cHnskV2t1LiHf9Lf5O+JLtykUBTpABZINKd0V8o2Yvx8bzrpZzhTxwLcNgt21PQFH9uAIjqSjzLtp50j1G/2FUfrBLWxK3vzalcTZU8CsDct2TR6/abFtcbZm63RY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=hammernet.be; spf=fail smtp.mailfrom=hammernet.be; dkim=pass (2048-bit key) header.d=hammernet-be.20230601.gappssmtp.com header.i=@hammernet-be.20230601.gappssmtp.com header.b=oH+JVF6t; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=hammernet.be
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=hammernet.be
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=hammernet-be.20230601.gappssmtp.com header.i=@hammernet-be.20230601.gappssmtp.com header.b="oH+JVF6t"
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-3eb3f05c35bso666454f8f.1
        for <spacemit@lists.linux.dev>; Mon, 15 Sep 2025 07:26:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=hammernet-be.20230601.gappssmtp.com; s=20230601; t=1757946417; x=1758551217; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=v5icuTPC0s/pPOE2ESDNXoDhKzwTzNxmTUDIIwZXJok=;
        b=oH+JVF6tl2dAlpE0EZGzfMIeBQPairkxrsCXOmK1FwZkM7EHKYw6feGIcrTqb+MUrt
         zTgow8gV+ZbD1bBJr9xxby32Cx4fAfmq0KXWknemOXRoq0zGedHYq/2PhyKnw/S7bC3w
         J0KfG2WoJtd4hpNvQsswtW2p/2/I3VgboxdFMTO7bh29b1SzJPWNxyiiUFesfj5ri24+
         sCDWLFsYmTWVOCDfp+SEVkHPN361KO8jgtO9Ny2lGd+urNk+kVCqmg1f1VknQ+X147da
         365PitQuSJcjcR9FeR2QZ7ro94083IzweWe1sI1wBqLpziA/rqpw4arnYY80OMKNOHBv
         SESg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757946417; x=1758551217;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=v5icuTPC0s/pPOE2ESDNXoDhKzwTzNxmTUDIIwZXJok=;
        b=Gvc97nhZB0PC+nCGtVn0kXLCz7t9Ky83lyPgwZXvG/65xwZw8jDFRwSyYvXzDiHstD
         CbmQ5AN4O4Ln/O56yQyhyfL2S2OVoqDruMnyhCZ+DriMAr0ghLfVEAzrZcOxqsAkezK9
         B+bVsaCm5X2Y5b7HGkrQJpVDJG9CBQWEwGJCNkOzOmicjARMbPBVhHsUOkLb/EJF/B/9
         brZ8kVp6RYB6/W2nrx4UJm6zp/ES+UASbe3Znbf+6U3lug3UKV5bf2YnDmNnsk3kPVVe
         xIjaBNaecizQkSj2gvxvlCN5y6vvN7N27zF5ystNtFx1o28RgikbbHmYTRmeemIGCueK
         qdEw==
X-Forwarded-Encrypted: i=1; AJvYcCWrJaBZIdVojDOvcwWeZQ4mUm7PA0GCDxm2aRxfZF9CfGJUY4rhFchfSdv7mUPUgw//LPF3Y5UU9Q==@lists.linux.dev
X-Gm-Message-State: AOJu0Yz+shuubI5KX/cde5eRmU+L/cndXe/QozNGwiBChrGpA11mKZcw
	IzBzhhyrj42ozwWolW5t44iv1ZxQwaSLbuZCgXONGzEX+jHywGGcPGTSEHYP5B9TmNs=
X-Gm-Gg: ASbGncs8vdQEOcj0lHpOJzkU4bXKyFSwyp97B+FQertgdasmxPQJcXoTYfIXon6rMi/
	22ajSr/zk4dHda/bLHeiSM0CXtKnU0gv4cP3cF+XxYh023ER06daNMMdzdhYIb2RGUSCG7vk4p+
	fjarj/XXtZLNXz/x4qoVy59H1Hi31XwTx7D4tbOw5bVScN3q9QsodOMGnCgrtPki0aHg0S+EY2h
	TIiLEb+Ms17jP2V3LRIuJl6pIbko1K9XGTODKs2PeehRAtZJrFxJjJauBcaCXVtr0Qs2k2MEhkn
	xwWW4+W6fEEnxBPc6cNBm4mCjjM1gdaAQXeo5k85j7Zl5FVGNpkB5GKHLca656jqEO0JYPUJMAE
	Xind/ZeQzK3Jxk/w9+JTDHf3FegNHzV1eY5I8tKJMd46MUsjU6eyTAEgeH+v//fNMes0qFlFcIt
	Z8FWfNkl4gYT0HdaONezklVKTazsq9Uj8L
X-Google-Smtp-Source: AGHT+IFs0mXefHor0OfcKtJiaLRNa2umUlSV0hyShyz1KhSiw3PD6NcKqHt+Ht1UUfx+184BUZwpHw==
X-Received: by 2002:a05:6000:1841:b0:3ea:6680:8f97 with SMTP id ffacd0b85a97d-3ea6680924dmr3500151f8f.2.1757946416790;
        Mon, 15 Sep 2025 07:26:56 -0700 (PDT)
Received: from ?IPV6:2a02:1807:2a00:3400:8a33:a6aa:d0e:30e9? ([2a02:1807:2a00:3400:8a33:a6aa:d0e:30e9])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45e01baa70dsm187561225e9.15.2025.09.15.07.26.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 15 Sep 2025 07:26:56 -0700 (PDT)
Message-ID: <aff80932-861c-4527-93a1-9fc2c1eb8d8c@hammernet.be>
Date: Mon, 15 Sep 2025 16:26:55 +0200
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] riscv: dts: spacemit: add UART pinctrl combinations
To: Yixun Lan <dlan@gentoo.org>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu,
 alex@ghiti.fr, skhan@linuxfoundation.org,
 linux-kernel-mentees@lists.linux.dev, devicetree@vger.kernel.org,
 linux-riscv@lists.infradead.org, spacemit@lists.linux.dev,
 linux-kernel@vger.kernel.org
References: <20250915112845.58134-1-hendrik.hamerlinck@hammernet.be>
 <20250915120031-GYA1251948@gentoo.org>
Content-Language: en-US
From: Hendrik Hamerlinck <hendrik.hamerlinck@hammernet.be>
In-Reply-To: <20250915120031-GYA1251948@gentoo.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hello Yixun,

Thank you for the quick review.

On 9/15/25 14:00, Yixun Lan wrote:
> Hi Hendrik,
>
> On 13:28 Mon 15 Sep     , Hendrik Hamerlinck wrote:
>> Add UART pinctrl configurations based on the SoC datasheet and the
>> downstream Bianbu Linux tree. The drive strength values were taken from
>> the downstream implementation, which uses medium drive strength.
>> CTS/RTS are moved to separate *-cts-rts-cfg states so boards can enable
>> hardware flow control conditionally.
>>
>> Signed-off-by: Hendrik Hamerlinck <hendrik.hamerlinck@hammernet.be>
>> ---
>> Changes in v2:
>> - Split cts/rts into separate pinctrl configs as suggested
>> - Removed options from board DTS files to keep them cleaner
>> ---
>>  arch/riscv/boot/dts/spacemit/k1-pinctrl.dtsi | 389 ++++++++++++++++++-
>>  1 file changed, 386 insertions(+), 3 deletions(-)
>>
>> diff --git a/arch/riscv/boot/dts/spacemit/k1-pinctrl.dtsi b/arch/riscv/boot/dts/spacemit/k1-pinctrl.dtsi
>> index 381055737422..8f87f8baaf77 100644
>> --- a/arch/riscv/boot/dts/spacemit/k1-pinctrl.dtsi
>> +++ b/arch/riscv/boot/dts/spacemit/k1-pinctrl.dtsi
>> @@ -11,12 +11,395 @@
>>  #define K1_GPIO(x)	(x / 32) (x % 32)
>>  
>>  &pinctrl {
> Generally I'm good with this version, only have one minor comment
>
> How about adding a "/omit-if-no-ref/" before each pin cfg?
> This will shrink the final blob size if no referece to the node
That sounds like a good idea.
I will send a next version with the change.
>
>> +	uart0_0_cfg: uart0-0-cfg {
>> +		uart0-0-pins {
>> +			pinmux = <K1_PADCONF(104, 3)>,	/* uart0_txd */
>> +				 <K1_PADCONF(105, 3)>;	/* uart0_rxd */
>> +			power-source = <3300>;
>> +			bias-pull-up;
>> +			drive-strength = <19>;
>> +		};
>> +	};
...
>> -- 
>> 2.43.0
>>

Kind regards,
Hendrik
