Received: from mail-il1-f195.google.com (mail-il1-f195.google.com [209.85.166.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85F5332B996
	for <spacemit@lists.linux.dev>; Tue, 28 Oct 2025 12:13:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761653628; cv=none; b=mQLwt3+7e8pK8n0xjJ5HJb9aiqcv0xHZzNoxs6x3XTR1xLZjQaJWfdvmSIBYXFRLPoMtdAmCpIWB/82KTBVymLG9tpL2mmRblxPIKhtFWV/pckhMmWgm/W51Xr9iX16sZek+jAM3lkZoBflmvMv9LcOLyi+g4fbNifj6ctDo1/g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761653628; c=relaxed/simple;
	bh=kbcPGBau+vooz71sYCj+fU43PtJotVJhPet/tmcL4PI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=LeLLet9OjMChH0ScAJ8pwb0C48ve+Y7OlsAS0gq9hxExoz2K2iYwoAo8QgZ+GNKxwiHO8mCvgDh854ZM4yBASCh9YgPobfDNxiAOSNHTX/rvou/qVRfpC3C6E9gRt0m/K/7o3+RVvbBEYZSz7LkBb1NQUezZUtDeVumuJVKM4ug=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b=iW4OvrWz; arc=none smtp.client-ip=209.85.166.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b="iW4OvrWz"
Received: by mail-il1-f195.google.com with SMTP id e9e14a558f8ab-430c17e29d9so24602745ab.1
        for <spacemit@lists.linux.dev>; Tue, 28 Oct 2025 05:13:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1761653625; x=1762258425; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=khwU93CFPe3QSgLFIeava2HVYo78KABRwFXaYkzJCAk=;
        b=iW4OvrWzxBBsNaIw0s0rcckLp+4SvXesb4IDDXFn6f9tGWF58RaApGnG+DVqV3t+tk
         ms3CKE/z1Fmc/DCK7/cFrHzCAPdz+NFDSPfdqlHUJR2Y9CPU7u8hTNYsp8pBz4zu5tZa
         U4M6PQiR76fCAZJUyVDQhjrmlefCnCGoNKFaR1NZu3fYBSEu/6sjAmcMRP7ZeZIoBE14
         Uhc9LY5/fZqXhQXu6jbJqMtXXmDr3bv59yxIYBgGz1UOH8m48m+1rUQg0+5LbrfhDkXS
         np0mAeguPa7o29203XDzu9VfModnJQY5PeiZat+bPx6sPAu8CvP50rdNpqGKW8BPf3ws
         XZDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761653625; x=1762258425;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=khwU93CFPe3QSgLFIeava2HVYo78KABRwFXaYkzJCAk=;
        b=ksC+G7p7GxHtHi8pksb9wuWerCWelFuCdDDvRrkdtHqL/bjbI58iFqYduNxs/TsG/P
         dSyQizjK3KNa0Nctiy7DaePIH9Fl8GLiRwMzgwSNYPt4s+u6GO+27xeIJrWTCWhVMjkz
         hg8LQrHM9EXDLZHPej1AqvJWbcojAMkthjbFQdj3otCxrEQVsIHZIFXdaP4CHkqaV3uS
         2+/0Tu1Ve/d4NZJuOjPKzSZSHusmqcmgv/EYEklnIxofQDqO7ax7tRbdqtEwVZOp7/7P
         P1s145ehiqF01PKAr75QeWm2i01FJdOzNWhm/C6d10Nq6RW30NiIwwxvCqVWSzINs+/S
         2GhA==
X-Forwarded-Encrypted: i=1; AJvYcCX/+VW3VcQG+ALLifCHem5UTse10cPOdYyj+94kJmTgC+jRamdRZcVxCG/z3o9K6dsDm2/Ks91VFQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YxAgrOGpX1AlW/FQe6RlXzeNiYIBkw/H3B3JoxXvEiMiIB+zwCA
	P7ffnyQmylyHKSH8nWhX5d+A6WVgJhKFDrVR0ifKf+U5gQQH04U1f5h9yS4Cl0YGSbM=
X-Gm-Gg: ASbGncszZiKeyz5bYfo7ZfoxpbqxCM3z/yPd5HOTJWuomOpH8mSWqTsbYJ1Nu8HLaVE
	qQjCM9FhXqo9KdFhuVUEuw6mAWCmgfYI+zR5Hw8qpTaVqk7+pK0CTD4EpvLer/NAYUnuPeCjpLb
	q73CyhFQgYgU4g2w+ABE0VWVBD5tXkhaJd9WNM7I5EwWlDuzlzrieqRRaeR46X6zmjDD6SHRmoH
	i1BA0OCKMBNAMPFtWzhTWLHWmql2VMb2RWuvkGH+xJsGLYKlCHX1c9g+uiwNZM3G8+utxfA3LV9
	IEhysLt04qL3+3kO8cXUuCjuAv4nSSBEuCDyHEHxHIdyYZRlrpGiNsY6XKLC9LO1OUGlZR69Kbr
	zB7G2bacsNNMcxNgnwExC1UNO7QelY4cuotqlqQlv2GlyB8T3JdUpKXvm0+Qqcc8dvkR4i3vbS6
	DVBqgJTT6o9UuOCC63DmDw6f97jA0qEfzIOYyEN/9T
X-Google-Smtp-Source: AGHT+IFFKmfRm7wHQRo/Azl9/WRSsx5DMAL5YyC5rW7dp5KofBMFZhyFfl0BPEsUUmZluzy0ORJ7BQ==
X-Received: by 2002:a05:6e02:18c5:b0:42f:9eb7:759b with SMTP id e9e14a558f8ab-4320f7a8a05mr41476835ab.28.1761653625563;
        Tue, 28 Oct 2025 05:13:45 -0700 (PDT)
Received: from [172.22.22.234] (c-75-72-117-212.hsd1.mn.comcast.net. [75.72.117.212])
        by smtp.gmail.com with ESMTPSA id e9e14a558f8ab-431f6898adfsm42280895ab.31.2025.10.28.05.13.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 28 Oct 2025 05:13:45 -0700 (PDT)
Message-ID: <71ee4a10-70a7-49e1-919a-0b47af4780fa@riscstar.com>
Date: Tue, 28 Oct 2025 07:13:43 -0500
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 0/3] spi: support the SpacemiT K1 SPI controller
To: Mark Brown <broonie@kernel.org>
Cc: dlan@gentoo.org, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, pjw@kernel.org, palmer@dabbelt.com,
 aou@eecs.berkeley.edu, alex@ghiti.fr, p.zabel@pengutronix.de,
 devicetree@vger.kernel.org, linux-spi@vger.kernel.org,
 spacemit@lists.linux.dev, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20251027125504.297033-1-elder@riscstar.com>
 <e4dd3db6-d554-4fd3-a674-60f2ff6e5475@sirena.org.uk>
Content-Language: en-US
From: Alex Elder <elder@riscstar.com>
In-Reply-To: <e4dd3db6-d554-4fd3-a674-60f2ff6e5475@sirena.org.uk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 10/27/25 9:40 AM, Mark Brown wrote:
> On Mon, Oct 27, 2025 at 07:55:00AM -0500, Alex Elder wrote:
> 
>> Between version 5 and version 6:
>>    - Rebase only
>>
>> Here is version 5 of this series:
>>    https://lore.kernel.org/lkml/20251013123309.2252042-1-elder@riscstar.com/
>>
>> Between version 4 and version 5:
>>    - Added Yixun's Reviewed-by tag on patch 3
>>
> 
> Please stop doing all these resends, this is just making things noisy
> and pushing you further down the review queue.  You should not resend to
> collect tags, and you should leave a reasonable time for review.

OK, no more.	-Alex
