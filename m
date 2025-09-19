Received: from mail-io1-f46.google.com (mail-io1-f46.google.com [209.85.166.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 155373191AF
	for <spacemit@lists.linux.dev>; Fri, 19 Sep 2025 15:25:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758295530; cv=none; b=I5LNhDFBJoHjXW96Pjy7Yie0SMmCY+6vWPAjpfX4gijA/30Jny6nVKNOH2A9lqN3cC3zomz7nJNHNZ/yN3JpfY24F57/d6Gt4Iq0+UCzJfPoEtUomBw7uB/vEJbq4C2P0t2y+rfR5tKomU+X+txrqMqDIxP2dwR3IbVbkHpv4+w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758295530; c=relaxed/simple;
	bh=BwF+XCw+2VY3IKbrShmTxOU5RWN0jZOIGyiJpln3Txs=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=afU6URmIKCN1Cxp2LjYOnQs+URslpBB3Hu9u5ISCsdOytVpnIEKQKWe4CnFcNUFkl6ZXhxb6ekPM8mlJlP7Zry/UWEWF1p2CgokCywnumV3+QbaPerRouONjvJ9/3DL4P8t3lqG8wZS5luCS2TSflfvAJhwYHTFRjXRyqaPabJg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b=BB8HfH1M; arc=none smtp.client-ip=209.85.166.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b="BB8HfH1M"
Received: by mail-io1-f46.google.com with SMTP id ca18e2360f4ac-887745ee814so77350039f.3
        for <spacemit@lists.linux.dev>; Fri, 19 Sep 2025 08:25:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1758295528; x=1758900328; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=+umzzpBSRQEc1V/CcodsQfdMrH/eWztzCvjBjz+cu5I=;
        b=BB8HfH1MT0yMjed6k6iUVYpkxY+rJWGulsnBLP9xIh7s9cNn6E5olW6Y2T5+BMHRxO
         DopkPD3FnRtuItvPNXhDCnplVYDoeFko3sa8AzpejQAXetKKrTwQ75cdWfhMSPaPq+nq
         rCoXY1Ht2o/oxMh3MBSheSuB1SOmx1thpsR7YOSe1xUwyEkObDk+zrMkt/UE/Rxv0/N+
         BMpfouoQEgvt0SsQLVGwgWjn0AkC2KB5LSaAJdI4kscInquS+2CM0ybtoD0NIMRmjuz4
         9xsOWIbvXfHzc5brU8TMMGyt97gbhKRjOzXANxKSM227cbaWbwFVHvui+lIgMnj96NCH
         tgrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758295528; x=1758900328;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=+umzzpBSRQEc1V/CcodsQfdMrH/eWztzCvjBjz+cu5I=;
        b=kTSD8nU7nquzdY5VEVfVvjVnHmhHOzd8Ynfl6iEtOo7pUYj5jdlihAhaxInYz0j8tM
         yzMZoCKtf1B2E25S1WX+kHjyzEKaBRt7Gm0AY70pt67fujdDZYQCu/i3Bq8GS0PoSEzB
         3/RvIE8UWbm63unHTQ7jeOBnmk1PhePbqjJ0ZA5bKZECUsXRmUyPbZeaCSw+yb+0fbpF
         /obBSVBhQwqJ2o7xpDgfRTbt/nBmV6e3a6gOtzT7lRBOHTz/dP82tkHY81oGO7rk/kio
         kln41lMEOq6iUBBBn3jYfXZoPZaVUQEVA4CZh4VmLPPc+ybhIlwmwRf1n8TotmpoU7Eg
         hkWg==
X-Forwarded-Encrypted: i=1; AJvYcCWZpt4zkVZXlSKUGF582HoweS/XW9D6s+3XvjFqoerWp36eeFAi9SodSPuucAmyrDhhosd2lM83Vg==@lists.linux.dev
X-Gm-Message-State: AOJu0YzskzkeJFsHraUbmppjolrQsznzOXii8GAz69mdBFqKJtuNnbWt
	GCnAWXaeE65Xzt8lo531ChP9abtj1VDA3FsbS1SSdldW31qa2ee7ZwwBHHZqybOEP08=
X-Gm-Gg: ASbGncus5+qo9GZ+qVNwGyFI6+ZOvUGGVXt3Fp4u4a0unX9f1LlJa7Qk2dxZE/jfaBo
	/we0Cg1l1H8O/DIQUQnPZ9//vUZCYy+wBQ0hGWEMIhG46RK/25DRcs4Dw7qj+N5+TrZx5IM63pl
	ulGIQJBjjMBmaqztBYrLb6Beb8J+++D/wW07LL5bjyBErQg5rFATVLItTKnoe/AuB/08RlSIgQT
	ddfxFMraibKaZjyAZha/+xvDVta4EGHWtqJFnjE5ska0yd44zmiaQUQfsdcA3Nhg1sdZE37iye1
	r2L+z1tbBVNJxBPqUYrCxH1HxwR/hBtgKtkmTewRjykgsOpay/zSKx5aPKhovI3WHdYJXYluYST
	dEJH9bb60tj0T6glAOe1BytMgmzgulPzMfA10WkwhFC63RpWJtdULrN7ORRJLjg==
X-Google-Smtp-Source: AGHT+IEQ0mHzthbytAS8eyolftKz1JqkUaR4qV6jomifOWCNp485ZfecaLw2j1twDeq58dbQEdVFTw==
X-Received: by 2002:a05:6e02:1a08:b0:424:7e36:f863 with SMTP id e9e14a558f8ab-424819ab873mr53155285ab.30.1758295527989;
        Fri, 19 Sep 2025 08:25:27 -0700 (PDT)
Received: from [172.22.22.28] (c-75-72-117-212.hsd1.mn.comcast.net. [75.72.117.212])
        by smtp.gmail.com with ESMTPSA id e9e14a558f8ab-42482ad64d1sm10124555ab.41.2025.09.19.08.25.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 19 Sep 2025 08:25:27 -0700 (PDT)
Message-ID: <ca775631-4e45-4a58-8f30-133cfbba854e@riscstar.com>
Date: Fri, 19 Sep 2025 10:25:25 -0500
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] riscv: dts: spacemit: define a SPI controller node
From: Alex Elder <elder@riscstar.com>
To: Yao Zi <ziyao@disroot.org>, Yixun Lan <dlan@gentoo.org>
Cc: broonie@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, linux-spi@vger.kernel.org, devicetree@vger.kernel.org,
 paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu,
 alex@ghiti.fr, p.zabel@pengutronix.de, spacemit@lists.linux.dev,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20250917220724.288127-1-elder@riscstar.com>
 <20250917220724.288127-4-elder@riscstar.com>
 <20250918133209-GYB1273705@gentoo.org> <aMwYRGjTdbQCJf3S@pie>
 <c32cc8da-6703-496f-b30f-4961aa811869@riscstar.com>
Content-Language: en-US
In-Reply-To: <c32cc8da-6703-496f-b30f-4961aa811869@riscstar.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 9/18/25 11:22 AM, Alex Elder wrote:
> On 9/18/25 9:33 AM, Yao Zi wrote:
>>> .. em, so the SPI will use pdma, then probably you should also adjust 
>>> Kconfig to
>>> select PDMA driver?
>> The driver seems to depend on the generic DMA engine API only, IOW,
>> theoretically it should work with other DMA controller as well. And it's
>> even capable to operate without DMA (see k1_spi_dma_setup()).
>>
>> Dependency to PDMA really doesn't seem something should be enforced in
>> Kconfig: it doesn't exist in code level, and the driver is actually more
>> flexible.
> 
> You're right on both points.  The code doesn't *require* PDMA to
> operate correctly (to my knowledge).
> 
> Yixun, what do you think?
> 
>                      -Alex

I did some experiments.  Currently, if I build a kernel with
SPI_SPACEMIT_K1 enabled (module or built-in) but MMP_PDMA
not set, the K1 SPI driver probe doesn't complete.  The reason
is that dma_request_chan() returns -EPROBE_DEFER, not "knowing"
that the needed driver will never show up.

For now I have added a call to IS_ENABLED(CONFIG_MMP_PDMA) in
devm_k1_spi_dma_setup(), and if it's not enabled it will
return 0 (to indicate "all is well, but we won't use DMA").

That doesn't allow for a different DMA option, but it does
allow the driver to work without an explicit dependency
on the MMP_PDMA (via Kconfig).

					-Alex
