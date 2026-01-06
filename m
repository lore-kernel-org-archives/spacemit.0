Received: from mail-qk1-f171.google.com (mail-qk1-f171.google.com [209.85.222.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1CBDD35950
	for <spacemit@lists.linux.dev>; Tue,  6 Jan 2026 14:43:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767710641; cv=none; b=Bwf0lmcWMF1nWe2LnY8I8LZ5NkvxFv7eY0l/RkEMkVIQ6Tyg/aoC2H+FjF/zK7+7wyu1EkwIR3acryrv9LXuq2v4N1YtEQWplUSh1haMdYNDaL9GaSSDmACopUfdk/F9fsryJlX47wp013Wad0gcf2SeIVNGe11N9EB+7HZ8ssY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767710641; c=relaxed/simple;
	bh=r49bs+7Qs8NsDj/N7bznmT1ZuVswJhyMFfKxM2sbSxw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=FEM9UXRM7GHGHSVbGSDodOhqfPaieDiU6LubWIw59hAdzI3Td72rXHhz9QI4bVVpqtUrovhpFxbzU+N9+Cn+UXXPcrvR8s9qZadtmV/CPgUxoVyBpZqwHWPyXiTSjZErMauS7JO3hBSrBjJrFIbc/rwRwaGDu3rdA90pbleI3DQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b=BkQLxBrM; arc=none smtp.client-ip=209.85.222.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b="BkQLxBrM"
Received: by mail-qk1-f171.google.com with SMTP id af79cd13be357-8b2627269d5so102195985a.2
        for <spacemit@lists.linux.dev>; Tue, 06 Jan 2026 06:43:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1767710638; x=1768315438; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=CqUOBca7OUQTkBW+LdJYJV8MljcXkA8rUk+TvUtdkC4=;
        b=BkQLxBrMx8NSD/UDVuJ1qchwKtGyg33VGT20Gq4GGrhEYRmKN/LbaGyhCpC+VGgJkZ
         ZNNj73mbYQKNblhYe4lhLFOTgl3V48lK2tmFgoRcuMZ3BchJgoKFjqYKoL5fN+0IQvbs
         1MhMZ1TI4Zu0fSdCuc5nqLcXCG2DXZPC/SXQ9YY3nXcPBcsVhGxISZSHAiwiJ7aN+j4J
         iAj7wIhyIWFuJAZoS6Ni79yIKMhQYz1lZ6lNTbsngRqGHDhDsQIL8obhzonHnsJ7vb+q
         11FvGPDmQ1RbnuXUfbRmCLA9ZEB6zhzfCXHMsTklPDHF0KHdar2IiNBa4K2KIp2RynHM
         qGfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767710638; x=1768315438;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CqUOBca7OUQTkBW+LdJYJV8MljcXkA8rUk+TvUtdkC4=;
        b=XiJu6cubm6Um604hAWYk9vgSnxOB6xnKu+BC+n8VH3/KX53fwiec8w8wbeK9pZ07Te
         mzTXF8EYZrHbwejB5AxCxSh0tXGfvA54lZmHmpRJwmSWQImYacqwNIcbLYL2G/R4P+e2
         P0s9LVszVLHz8y8aYck4oNpTqY7u1TqjrXqVMVdesxHEeZDb81xVsac+tjsSbCFvG8hF
         rjwRYgMlBev6L+CKtpZ+soZPlrQTnqgWefi5J39R7qxC2aJJ43CLrUpWdMvGzSCl7EAg
         XeKrgvWlWtd65DXKV8S6uP3913p3NRjy6FiCGOxiDKOmAAPUpE3LNfPv7OZnjflIr5WY
         aITQ==
X-Forwarded-Encrypted: i=1; AJvYcCXogbM3zGkf32MPwR2wgITA2e0ChJsAETJTmTrVQrKwbHOzM1USE97G5zPIAB1kTlCLfhku9I1ktw==@lists.linux.dev
X-Gm-Message-State: AOJu0YwM6qAknSBvxON7XlsIlKxbVsUgtC1r6ycrH9ce45qgMkWCP626
	afG2GWLHLLTelOOnkMpTv3mO7F1DPwyYivByavZD4bSCoFw/pshZoU/Umcce0lbDECE=
X-Gm-Gg: AY/fxX6KqAM6D/dNHS6CCwS7nvf3Vp642TB9b4yCe/XAugQp72kJC1yhfySKyRKihHM
	cfajTYBG1dbsyBVYvYmP1aT5bACGhyhFkoa6DzZiGzkguKr9k3VZtm+HDzyQZpD/xOA89gCgxNK
	DWm1+XLW9IfWSK46Vu8fzH9jVTVeU++UFAHPhm3xZJBpWKFuhR3i7m+csJWIC5z106EKt1CAZAq
	rFnUayf18gky+KPXKricVqu3ct51Bq7rYwhNTXRCZe2tzV6TfMio8aUXJAqwlRqiImejJjn8ZbZ
	PsvsBNC2hKo2INftkFZIJE5qA7lODJk/+rl0ttmILaLqZvFJMnwMxjK2tFuqvQYBz915re0Uy1g
	LxToXsdjF+UuxsC4J7A5AGHWKPBPBkkknEy9sARyLWt89sq7NlecftcQggUrmDI6vCwVj6hREfa
	l+OtGONTmDPFv4NaqWPAmD2u5USDgwol/atfehvZKQ+RmZk4Dam5c=
X-Google-Smtp-Source: AGHT+IGsExHw7kmZLolfw+ZMAQgKhdT3ljZ72+j77ytqYSqQi2wGdBc4Exxo++iBk542WCsTNheI3A==
X-Received: by 2002:a05:620a:1a9c:b0:892:25d5:2ec with SMTP id af79cd13be357-8c37eb7afe5mr382734385a.27.1767710638057;
        Tue, 06 Jan 2026 06:43:58 -0800 (PST)
Received: from [172.22.22.28] (c-75-72-117-212.hsd1.mn.comcast.net. [75.72.117.212])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8c37f51b732sm173883085a.25.2026.01.06.06.43.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 06 Jan 2026 06:43:57 -0800 (PST)
Message-ID: <017413d7-426f-495e-94df-b93e39b0be98@riscstar.com>
Date: Tue, 6 Jan 2026 08:43:56 -0600
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 3/4] clk: spacemit: add platform SoC prefix to reset
 name
To: Yixun Lan <dlan@gentoo.org>, Stephen Boyd <sboyd@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>,
 Philipp Zabel <p.zabel@pengutronix.de>
Cc: Guodong Xu <guodong@riscstar.com>, Inochi Amaoto <inochiama@gmail.com>,
 linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
 linux-riscv@lists.infradead.org, spacemit@lists.linux.dev
References: <20260103-06-k1-clk-common-v3-0-6061d9f69eef@gentoo.org>
 <20260103-06-k1-clk-common-v3-3-6061d9f69eef@gentoo.org>
Content-Language: en-US
From: Alex Elder <elder@riscstar.com>
In-Reply-To: <20260103-06-k1-clk-common-v3-3-6061d9f69eef@gentoo.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 1/3/26 1:26 AM, Yixun Lan wrote:
> This change is needed for adding future new SpacemiT K3 reset driver.
> 
> Since both K1 and K3 reset code register via the same module which its
> name changed to spacemit_ccu, it's necessary to encode the platform/SoC
> in the reset auxiliary device name to distinguish them, otherwise two
> reset drivers will claim to support same "compatible" auxiliary device
> even in the case of only one CCU clock driver got registered, which in
> the end lead to a broken reset driver.
> 
> Signed-off-by: Yixun Lan <dlan@gentoo.org>

Looks good.

Reviewed-by: Alex Elder <elder@riscstar.com>

> ---
>   drivers/clk/spacemit/ccu-k1.c | 12 ++++++------
>   1 file changed, 6 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/clk/spacemit/ccu-k1.c b/drivers/clk/spacemit/ccu-k1.c
> index 02c792a73759..dee14d25f75d 100644
> --- a/drivers/clk/spacemit/ccu-k1.c
> +++ b/drivers/clk/spacemit/ccu-k1.c
> @@ -789,7 +789,7 @@ static struct clk_hw *k1_ccu_mpmu_hws[] = {
>   };
>   
>   static const struct spacemit_ccu_data k1_ccu_mpmu_data = {
> -	.reset_name	= "mpmu-reset",
> +	.reset_name	= "k1-mpmu-reset",
>   	.hws		= k1_ccu_mpmu_hws,
>   	.num		= ARRAY_SIZE(k1_ccu_mpmu_hws),
>   };
> @@ -900,7 +900,7 @@ static struct clk_hw *k1_ccu_apbc_hws[] = {
>   };
>   
>   static const struct spacemit_ccu_data k1_ccu_apbc_data = {
> -	.reset_name	= "apbc-reset",
> +	.reset_name	= "k1-apbc-reset",
>   	.hws		= k1_ccu_apbc_hws,
>   	.num		= ARRAY_SIZE(k1_ccu_apbc_hws),
>   };
> @@ -971,21 +971,21 @@ static struct clk_hw *k1_ccu_apmu_hws[] = {
>   };
>   
>   static const struct spacemit_ccu_data k1_ccu_apmu_data = {
> -	.reset_name	= "apmu-reset",
> +	.reset_name	= "k1-apmu-reset",
>   	.hws		= k1_ccu_apmu_hws,
>   	.num		= ARRAY_SIZE(k1_ccu_apmu_hws),
>   };
>   
>   static const struct spacemit_ccu_data k1_ccu_rcpu_data = {
> -	.reset_name	= "rcpu-reset",
> +	.reset_name	= "k1-rcpu-reset",
>   };
>   
>   static const struct spacemit_ccu_data k1_ccu_rcpu2_data = {
> -	.reset_name	= "rcpu2-reset",
> +	.reset_name	= "k1-rcpu2-reset",
>   };
>   
>   static const struct spacemit_ccu_data k1_ccu_apbc2_data = {
> -	.reset_name	= "apbc2-reset",
> +	.reset_name	= "k1-apbc2-reset",
>   };
>   
>   static const struct of_device_id of_k1_ccu_match[] = {
> 

