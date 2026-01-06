Received: from mail-qk1-f171.google.com (mail-qk1-f171.google.com [209.85.222.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4AF09314A82
	for <spacemit@lists.linux.dev>; Tue,  6 Jan 2026 14:44:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767710643; cv=none; b=Yg9ai3DhrLaTiZBQtX1Tsoc94plOQCmoc9bK8/7v2wbVluZkXAN5E6K0Q8EPfq5lwQ+OG44/YlNC/YX2KtHruNK8GJSbG/B6caWyEYG1zslOmRsp78CY2p8maPZOqCaxNmMLP1XSxZDEbGJChCr64kC6l2Y8Vybw+jFSYytikuc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767710643; c=relaxed/simple;
	bh=xWDoSIsxgM+RQVtckDWggwk39PYhLqYdEi36Mi+d7Xw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=YDw+m8bmdH7iQy+BULF1hcyuR72NK5LG69SsRoS2qoJe/7jTJP8AiQAxRQhDEXXXetcGBW+XUANewCcWB0c76vAabBkJvXHa8V4xpn0f1PPwlvu6F7YiIWpbM6c2hZZjOgpYVgPmARE4k5Am0/XFq4TFG4V/B04fuwUATyQS9sA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b=o2eBF8ie; arc=none smtp.client-ip=209.85.222.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b="o2eBF8ie"
Received: by mail-qk1-f171.google.com with SMTP id af79cd13be357-8b1e54aefc5so81701785a.1
        for <spacemit@lists.linux.dev>; Tue, 06 Jan 2026 06:44:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1767710640; x=1768315440; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=a0O6uqIuffeH+rUN8PGPXOYCGY9UdGKz4wTv0c6GmNM=;
        b=o2eBF8ieDR6VQyPashTtrVk5EGJeMWsr/tpgGZ3fcIvT3CEaf/mumrRQjZ7QaEWr4H
         cZ1n4qGUSL95KGIe9tuJLytqhyePBwscKvlx7CpqsPNPImeYNP1FvK5ilHEqguZ7XEyB
         FrMu3Va+uGpf5pEtdAkgrw9HHCYQGZjrXfldlC5Ji1LUVQK3DRuPI732HUH6/Vj281kt
         /J1KQzIcLMKeHz1LEQtikIP0AvfSTEiUD1ZWIrVy4qzfqmWtRhgg9PfkTLPbuYEC9Bz4
         jazCiiL+gk6Qem3n1NCOIFUvc3DQZk9sXCA5nm6yHOGuIMED1PuEWVBjOHPlx9hUwx3F
         VcAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767710640; x=1768315440;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=a0O6uqIuffeH+rUN8PGPXOYCGY9UdGKz4wTv0c6GmNM=;
        b=QgsqKalHGFmyZB1OAwAgvcoCV4L78cRJmJjX0C0FhMizTp8gf9E6qBmk3pLQCBvCre
         +UKxmDBgJcV2HpA6zITa+CpugRqQBUMIHRxO1lUGdskDCdNK7zhcfN88mKuFNBcE1ZPP
         8CmKyNx466cUG5DVFDvCiGSv6hpLLxJVDZTr3UjdB7pefZfJyjNdBxWI3SPhjnHjpYok
         ajPoFLlKeuCFb4iZsB1TfmmMxd/NUzuwcA+RfD/3ChAKG07kQN1Io1CUeUXgAmC6c2t3
         NtX3O5tKuo8uKxAQbdBBN4xDMl/rVISI8dw69vQd0mHej2QWHgDg/yoAk0ZpKaHBZ83Z
         k7yQ==
X-Forwarded-Encrypted: i=1; AJvYcCVya6hSHgIQapun+ZciZq1BenVOU8nYGt/4tmFSWCro68BgUMypBOGoiFHN0VU3UwBkwC4XXHLi9g==@lists.linux.dev
X-Gm-Message-State: AOJu0YzQD+bJKQTpdIrcNiCn0MhMdaaEi4UkIxbQVNH75GeUlGwjK8Bv
	z7lHjwyEBoY5XTCzLkG+IQz2zLx9LJghcYEFirRXc53PycA3/hX4daNsW7/smnQ7F4o=
X-Gm-Gg: AY/fxX67VflRQPk3J0MHhGD8G3pdF+6qB+h6FjdHm5TIsqd3Wd/fny9s6dpR+MLnAhZ
	Dz4323ztub1e+D7P3JzpEmk0N8QDzhRxC74vt0JsZMzHRJVMvaA6kIqZTcNkpwK8t6S3sxlN/gE
	g+VgbhlqZOS+Z8a99YriVjVByJith4T0UBCG7ltRPl3793EB/U5+H/j/RDymDNg1qLQO59Ww5wx
	QhOLOfIHY1czi0grgEtACeYVpJ3LqvSWucrkKNmkLTnflq952p/VK8/X0Kv0cVPVBVCmBvMaQ3n
	Pu2mLmvnnIUy6XL8+ourVgnaxrgxoK4EOTdeEQfi7YY84zS/sxC5k/2gqyKmMzoVTSgJ9ztvdsj
	jP91V3PoaHZjQYuZLVeUIpWj+by7t1YI2TyJ/K9/UcvQlnwWgmSN1rwYAcgv/kp8KXlv17pvae+
	RRGfbgtkz51wb1/glGZtkXn2J/lx+FFkERR0S1Hv7UeaZgRocR3MszDF6gc9e7FA==
X-Google-Smtp-Source: AGHT+IGrfIQofU9ZXGHQqOM8HyQbxngWETjyA4UE68tcePwXWmd7b3PCLuyw9SW25mP3XlxN8HPLDw==
X-Received: by 2002:a05:620a:1725:b0:8b2:e9d2:9c69 with SMTP id af79cd13be357-8c37eb6cbcamr425625385a.22.1767710640277;
        Tue, 06 Jan 2026 06:44:00 -0800 (PST)
Received: from [172.22.22.28] (c-75-72-117-212.hsd1.mn.comcast.net. [75.72.117.212])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8c37f51b732sm173883085a.25.2026.01.06.06.43.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 06 Jan 2026 06:44:00 -0800 (PST)
Message-ID: <058d3911-ff2d-4151-b585-5bcb8810bedf@riscstar.com>
Date: Tue, 6 Jan 2026 08:43:59 -0600
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 4/4] reset: spacemit: fix auxiliary device id
To: Yixun Lan <dlan@gentoo.org>, Stephen Boyd <sboyd@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>,
 Philipp Zabel <p.zabel@pengutronix.de>
Cc: Guodong Xu <guodong@riscstar.com>, Inochi Amaoto <inochiama@gmail.com>,
 linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
 linux-riscv@lists.infradead.org, spacemit@lists.linux.dev
References: <20260103-06-k1-clk-common-v3-0-6061d9f69eef@gentoo.org>
 <20260103-06-k1-clk-common-v3-4-6061d9f69eef@gentoo.org>
Content-Language: en-US
From: Alex Elder <elder@riscstar.com>
In-Reply-To: <20260103-06-k1-clk-common-v3-4-6061d9f69eef@gentoo.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 1/3/26 1:26 AM, Yixun Lan wrote:
> Due to the auxiliary register procedure moved to ccu common module where
> the module name changed to spacemit_ccu, then the reset auxiliary device
> register id also need to be adjusted in order to prepare for adding new
> K3 reset driver, otherwise two reset drivers will claim to support same
> "compatible" auxiliary device.
> 
> Signed-off-by: Yixun Lan <dlan@gentoo.org>

This would ideally be merged with the previous patch.  Maybe
Philipp can negotiate with Stephen to have that happen.

Reviewed-by: Alex Elder <elder@riscstar.com>

> ---
>   drivers/reset/reset-spacemit.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/reset/reset-spacemit.c b/drivers/reset/reset-spacemit.c
> index e1272aff28f7..cc7fd1f8750d 100644
> --- a/drivers/reset/reset-spacemit.c
> +++ b/drivers/reset/reset-spacemit.c
> @@ -278,7 +278,7 @@ static int spacemit_reset_probe(struct auxiliary_device *adev,
>   
>   #define K1_AUX_DEV_ID(_unit) \
>   	{ \
> -		.name = "spacemit_ccu_k1." #_unit "-reset", \
> +		.name = "spacemit_ccu.k1-" #_unit "-reset", \
>   		.driver_data = (kernel_ulong_t)&k1_ ## _unit ## _reset_data, \
>   	}
>   
> 

