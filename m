Received: from mail-ua1-f49.google.com (mail-ua1-f49.google.com [209.85.222.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8BB91366806
	for <spacemit@lists.linux.dev>; Tue,  5 May 2026 18:21:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778005276; cv=none; b=X8fbjXuzEgQ7HdWEWLn6XndMVu3vb3zXJVsE4Hzdr/Q/AKhvQ+N6fSvvqGs04NGvM0EE3u8PbzCltLm/455NuBrUHUDpKE+TosTkGNaJyLfwTZFg5POEA9HeJyVojDS0ErQ9Ya0hs/Tbr/uXhJIvbiAZ0XdRubQZkwfmjG3/Lk0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778005276; c=relaxed/simple;
	bh=w+Ioz1tjQWfX92hV7FphRnIAnvcQ0m2pdhQNSWwnwV0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=WIAML2Iya0VrEkagsOqrOS9DivNkGKTFJw0+xkXKaZsLkrP/q3XBq0jTqFDQHIQBeOWyNAF84DutSx2xw/Dy42uSajHemBf/81EHIRfRawNNafvEuX9sHRpi8K9h8/6ufyDbyPDj9OsNBxPXOHqA1i1JRsaiaCTdNf6IjkrASz0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20251104.gappssmtp.com header.i=@riscstar-com.20251104.gappssmtp.com header.b=ulN4BPsP; arc=none smtp.client-ip=209.85.222.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20251104.gappssmtp.com header.i=@riscstar-com.20251104.gappssmtp.com header.b="ulN4BPsP"
Received: by mail-ua1-f49.google.com with SMTP id a1e0cc1a2514c-9568bae58f7so3225762241.3
        for <spacemit@lists.linux.dev>; Tue, 05 May 2026 11:21:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20251104.gappssmtp.com; s=20251104; t=1778005273; x=1778610073; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=4PAwVM1Z+cNq31xz020hTCHt7IsL4VWpTOpbAV7HgmM=;
        b=ulN4BPsPIc4OwHLqLIg5L6bauquvjZicoUof7d2iZH4yGktqmu8KXgslh26CIM2Jbv
         aY0H/GMlCdS5hMltN6Vi64lzkcB3/UK35k5qff5XXrg9zIkRFc6KeYtAn/fAQIsYwI8X
         wE60apSvorc4SBdOSGjC4IZmSOe3BBuFhPnqMhi+Nuni56arFh+iDqI7o5rr2XhIXK2K
         n3MijbnVGvfykzmESaN00YzDoUgkOfjtqP4zI2tiYEqqCXjYM3lnY1WYu1CXD+q0h9Tx
         ws2uGDaByULgZTBk1KpJCtOj4NK0MOZvUrMYR7+JjqAlLViQA+Q9BJwo6149fA9F1Uaa
         1UIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778005273; x=1778610073;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4PAwVM1Z+cNq31xz020hTCHt7IsL4VWpTOpbAV7HgmM=;
        b=PXFLMnY50+USnFYE3Uku8h9bOIhreeYOWp/nLxOTkqbI9h1mz3urPvHicvWs3hXx73
         rCB/PfWYTg2Xr7lm09NKD2GNDCnV5f14UTo4qqSsMLfQH1N6Eexx7LxNc6kGrp/GkNlS
         tslSnO98LeBHSjDnU1jMRioIC3TzRw4qLIHhuXm6o5mTkNQ9wAw3FcMS4Z71UxG2nZuZ
         b3RcAPEmNWbvcZZkDdsfqgY9ovJ/rV9MM1IlH9w9wxIjJ46mBVkKlpkkW0pvD5lK2IeG
         a9R/z8l8YpSSluz4TGkcBgMth/zCPW5tjauqCgrWKHjG7fKFoN+c0a/j/QR876gb28oZ
         HZFw==
X-Forwarded-Encrypted: i=1; AFNElJ/1G6QqF2wX2s3eVc9G55wx+UHtO9Jje39ruIUJbV/+QPigYCTQ6zF9lgwUefGUSM4orT+ixW9tAA==@lists.linux.dev
X-Gm-Message-State: AOJu0Yyig2qY7v43A+FAYkRDqDPdAsp6lj0KhLYpbzFhxqaO3tMZURI0
	RQmiflJVHNFTU53kz0JTwCMP/KR1o8wBMyAX1Nh4/a0FYgORt/Ooy0A/R/AJsQDKVnY=
X-Gm-Gg: AeBDietYxj7a64QPi625/8/JkojP7uQrbEHTDXniAgbqU6xoDJhBALx60lh0kZek8i/
	JqFumpz0e2ZFWeDIqexANtyJPY5Q8j6RX7FyaznTWg1Bcd+BtLrmISR7fgLtQuLIKfhMimiF08a
	j5YhKxmlJwmME+oYg8IiU5k6BDdiwEweEfUMle62WVbLtilpLzPFCwnXfMhUxmHq2dR5jGy8LPs
	gHa24/2U0ZeiPzmMmoYcuzX0rprLaHFDOMfo8bEjyNx3g+OG7G6W+plGz5v50X25iDC/fOkUkhK
	iyb/trzrrpnEcfQeDHDbfgvvvauzOn3XxolpOX+5E/mbALV6ds9P1X8P5rfM76sEWBxw08tvspg
	JtFj/V5ZBTOkExznxifbDjOaxPGs4gbK2PVRvMei/K9DSRy5s4ElPVIm1N5hXTNxkKufvw/vedU
	3qiHJbi/QC5ZpBeKNolO0JwNzBelHtDEz5iNCAVIpi+LeM3IW6HAyCrtkA3yuAiUgpgouHAa1O0
	UyhHT6wR7Nx
X-Received: by 2002:a05:6102:5a96:b0:611:3bcb:aee5 with SMTP id ada2fe7eead31-630f4e3dab7mr792844137.0.1778005273387;
        Tue, 05 May 2026 11:21:13 -0700 (PDT)
Received: from [172.22.22.28] (c-75-72-117-212.hsd1.mn.comcast.net. [75.72.117.212])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8b53c0e7f27sm185778316d6.32.2026.05.05.11.21.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 05 May 2026 11:21:12 -0700 (PDT)
Message-ID: <9f655145-2c97-4de0-b964-1e23ab95de1c@riscstar.com>
Date: Tue, 5 May 2026 13:21:11 -0500
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] spi: spacemit: avoid 32-bit integer overflow warning
To: Arnd Bergmann <arnd@kernel.org>, Mark Brown <broonie@kernel.org>,
 Yixun Lan <dlan@kernel.org>, Guodong Xu <guodong@riscstar.com>
Cc: Arnd Bergmann <arnd@arndb.de>, linux-spi@vger.kernel.org,
 linux-riscv@lists.infradead.org, spacemit@lists.linux.dev,
 linux-kernel@vger.kernel.org
References: <20260505175744.900750-1-arnd@kernel.org>
Content-Language: en-US
From: Alex Elder <elder@riscstar.com>
In-Reply-To: <20260505175744.900750-1-arnd@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 5/5/26 12:57 PM, Arnd Bergmann wrote:
> From: Arnd Bergmann <arnd@arndb.de>
> 
> Calculating the bit rate in nanoseconds does not fit into a 32-bit 'int'
> type, as gcc-16 points out:
> 
> drivers/spi/spi-spacemit-k1.c: In function 'k1_spi_set_speed':
> drivers/spi/spi-spacemit-k1.c:393:38: error: integer overflow in expression of type 'long int' results in '-589934592' [-Werror=overflow]
>    393 |         nsec_per_word = NSEC_PER_SEC * BITS_PER_BYTE * drv_data->bytes;
> 
> Cast the value to a 64-bit constant to force the longer type for the
> calculation.
> 
> Fixes: efcd8b9d1111 ("spi: spacemit: introduce SpacemiT K1 SPI controller driver")
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>

Thanks Arnd.  I diagnosed that when I first saw the warning and my
fix was identical to yours.  I believe Mark already merged the
fix.

					-Alex

> ----
> There is probably a way to rework the algorithm to avoid both the 64-bit
> multiplication and the following division, but I kept this as a minimal
> change.
> ---
>   drivers/spi/spi-spacemit-k1.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/spi/spi-spacemit-k1.c b/drivers/spi/spi-spacemit-k1.c
> index 99db429db0b2..215fe66d27b4 100644
> --- a/drivers/spi/spi-spacemit-k1.c
> +++ b/drivers/spi/spi-spacemit-k1.c
> @@ -390,7 +390,7 @@ static int k1_spi_set_speed(struct k1_spi_driver_data *drv_data,
>   	 *   ticks_per_word = BITS_PER_BYTE * drv_data->bytes;
>   	 * We do the divide last for better accuracy.
>   	 */
> -	nsec_per_word = NSEC_PER_SEC * BITS_PER_BYTE * drv_data->bytes;
> +	nsec_per_word = (u64)NSEC_PER_SEC * BITS_PER_BYTE * drv_data->bytes;
>   	nsec_per_word = DIV_ROUND_UP_ULL(nsec_per_word, drv_data->rate);
>   
>   	/*

