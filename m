Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C0121A275
	for <spacemit@lists.linux.dev>; Mon,  1 Jun 2026 06:49:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780296543; cv=none; b=qboJv88tCMQ4akxCLvaU3dtDxdL76qLGVIgzQASR9vXGtQ0EJe3qfnGP3bfsrBFqrJwQaPu/8y0PC1p/5Whh5oec9lQWUEDRw3yIgw42jyC3n8e8Vcq1UM8NRhGksnsCzJblzXAFh+m3al/aVysL2fbbDFODE49xQ07tCtlD1FQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780296543; c=relaxed/simple;
	bh=y4/ouupBjoYRS77m3fiaKDERYhLyJZEdAdivWI66SqA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=UWaGmT6MaHl+Ot5bl/WXaYQQQhP77FsRWzsVUD5C5oPgMJQQYEunecmc2oPEef8F+NMQBFZqWS0KNHL9NFHCQF+U8U3BEJ5kijQlGew4Os4Ev9kPKB+XlkZ3ckylwRBH0Mg+y5Ua0E51w8MStGhNjZcG00KVtTViYzq/TNguVCc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gu6rjTN4; arc=none smtp.client-ip=209.85.167.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gu6rjTN4"
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-5aa68e66128so886056e87.2
        for <spacemit@lists.linux.dev>; Sun, 31 May 2026 23:49:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780296541; x=1780901341; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=pGxbL9faVDVgrvfQsBar+KVqQ+FJr+nh53Wa1vgTsOQ=;
        b=gu6rjTN4pWCuTZsYyKnIVX9rDYs1yl+zmsuKbYQqQYXFzNKIKv3zs6ZzvjWMOopyeC
         6lomPK4q0jzDi/oO2/VJQnNS4dAMZWLkwuqXtiRydpGx0q0eEaZ23Uog6gZLBBh4HvMY
         ah0cKuPWXkamnCC7k/UaVHpLQA+psKlu8IZFIW66lrjOi/iAKzqAdiNcfFWcN67ERgu3
         KQ9CL/KhJYhhyqmItz/vbiiwAQg5Db+AIXLvk0OSMJGMll+FtMKnm7Kn70ftLO92OG3D
         gNpaMvHJZuvQy7lhEIOrbFKBoPqchceenyZ6HuEVNvSAJUqd6Wa1U4a/LUxWyBsWTYXx
         oKKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780296541; x=1780901341;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pGxbL9faVDVgrvfQsBar+KVqQ+FJr+nh53Wa1vgTsOQ=;
        b=lrPqBaidM+9lXUFzQ+zXq/ndjz8d8VkneOfR/FBJlYuUZyGKaSBmuQLAVvoi/6+ljq
         9JUKgiAfKwfpowClj1bg+DOuqsGbBR7Cj7wZ/4tIqgexjs26z2C2DKSfvmjUXHgKyfCB
         YpunekE3U8uiG2rBMvniQ2nZjuUlFwnTNr82+BB0pikjY1TMTOb+1sjD+/Ua8lyuPGHd
         i0iFcJ1o8OdW52E9+UxsPhOkuBbTytomklekZk0/cuDFuuXVvVv8wS+bvtkHLeCEfezx
         Vdu4+G1eAOybfjLSjqAm4za1REAjmtCIMgbFqwMgO2RWV8X7M0daNOBKpJt6Xxo3j2rU
         A0lQ==
X-Forwarded-Encrypted: i=1; AFNElJ+6Lx/4+VoVkYkGaXV78pCSQ88hvHL1MqASPPM5UpevgCg9axNItfitEEo/5eQgeNnLRS/d08ezjA==@lists.linux.dev
X-Gm-Message-State: AOJu0YxgMPv/OdBZrRzTkpIgDnPTERLj/rIaEmGH6JxX8qsL193UsBYd
	QcXn/+ZVWmKzPBzi8hMu+4mKAxcxduLyIiMr5JE3C/15lpRJ/3iI0fIK
X-Gm-Gg: Acq92OFQQ+3Z+l2SSfxBahlCwf8wq14dncphwaNWa4IMo4/2/FAV1S+AWPemTI+wZTz
	xA9po2CCMx4ztQe4OTnOnT5/cy3up8KZqYpJ3w3hnYFwUbzZH46BssoIHz451MVE5tJ5dnUYTMU
	28mISwUfCUTlA7w3gzpf0z7rZQAeYnqHLK+dJRKtcnLjilDzKcwHpdnWv76WztHBC+e7RhWJHz+
	UOtfIEV7lK5Eyq883BmnpP/daPAsWZOskbEC4hLA2izzKP9Nw5J14XYCF60sDa60yBhAWPIigrK
	//m6TeYiW80gdVrTNrFfZukGwBlDu3YNgIqIocwgquzQVJwE3yhm6p7RHeGR1WNBVLncUhQcwcH
	CC6XN6rFl86FK3GsfH6FFUuhCWRGQF1uU9wBe8OPzROYphLx271Hjsukak2GtgIlR77VkoOt/lx
	CfjOERNY5+cGXAZiUtzCP9rfVJNK1z9XUrMOT1Atx5sEAe474ZCWtd3eYtiMmypCsMZMScmjOJu
	uhdMBVH1mW1nx2LGpo=
X-Received: by 2002:a05:6512:2306:b0:5a3:f25f:cc30 with SMTP id 2adb3069b0e04-5aa60a32f56mr3289885e87.32.1780296540285;
        Sun, 31 May 2026 23:49:00 -0700 (PDT)
Received: from ?IPV6:2a10:a5c0:800d:dd00:8fdf:935a:2c85:d703? ([2a10:a5c0:800d:dd00:8fdf:935a:2c85:d703])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5aa5b793e24sm1898970e87.73.2026.05.31.23.48.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 31 May 2026 23:48:59 -0700 (PDT)
Message-ID: <b509c623-a47f-4216-9202-2c542f3c2e7b@gmail.com>
Date: Mon, 1 Jun 2026 09:48:58 +0300
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 4/6] power: Use named initializers for
 platform_device_id arrays
To: =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig_=28The_Capable_Hub=29?=
 <u.kleine-koenig@baylibre.com>, Sebastian Reichel <sre@kernel.org>
Cc: Yixun Lan <dlan@kernel.org>, Andreas Kemnade <andreas@kemnade.info>,
 Sven Peter <sven@kernel.org>, Janne Grunau <j@jannau.net>,
 Neal Gompa <neal@gompa.dev>, Amit Sunil Dhamne <amitsd@google.com>,
 Samuel Kayode <samkay014@gmail.com>, linux-pm@vger.kernel.org,
 linux-riscv@lists.infradead.org, spacemit@lists.linux.dev,
 linux-kernel@vger.kernel.org, asahi@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, imx@lists.linux.dev
References: <cover.1780048925.git.u.kleine-koenig@baylibre.com>
 <1ceacf4f9c3f827bcad85b378aa04cdca1c04635.1780048925.git.u.kleine-koenig@baylibre.com>
Content-Language: en-US, en-AU, en-GB, en-BW
From: Matti Vaittinen <mazziesaccount@gmail.com>
In-Reply-To: <1ceacf4f9c3f827bcad85b378aa04cdca1c04635.1780048925.git.u.kleine-koenig@baylibre.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 29/05/2026 13:18, Uwe Kleine-König (The Capable Hub) wrote:
> Named initializers are better readable and more robust to changes of the
> struct definition. This robustness is relevant for a planned change to
> struct platform_device_id replacing .driver_data by an anonymous union.
> 
> While touching these arrays unify spacing and usage of commas.
> 
> Signed-off-by: Uwe Kleine-König (The Capable Hub) <u.kleine-koenig@baylibre.com>

Reviewed-by: Matti Vaittinen <mazziesaccount@gmail.com>

Yours,
	-- Matti

-- 
Matti Vaittinen
Linux kernel developer at ROHM Semiconductors
Oulu Finland

~~ When things go utterly wrong vim users can always type :help! ~~
