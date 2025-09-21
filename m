Received: from mail-il1-f171.google.com (mail-il1-f171.google.com [209.85.166.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DB0C1BC4E
	for <spacemit@lists.linux.dev>; Sun, 21 Sep 2025 18:58:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758481135; cv=none; b=NXnh0OA9lEBoyAKgeYkxLqIGrWTrWwXjBjj0ZzVyvfQOFzsIgZws56PgQzD2UhZb56SeybpWoJzeGzhNxlMGX/BjOkkUey/Uai0lJ4orO3NUtTsMldYSlhUMX1WZGLo1A/lQRQlphpXpyjMsVce8ZB4jRFaJ2CO5JUYvQzAtUWk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758481135; c=relaxed/simple;
	bh=w8WpeZPhF8DveCAu9nZH5IdpjTp7dXBeqPT5tY/beCM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Rf/pLVyeWOBfSMlXfrzvqfgJF87484uMIUMKgK6/qxLaF4XpkH+o0B+ijejtiZxzRSOWGQMDfaezuGDTS/gqPQi5b2hP6hW4uj2jwkcPbsJD4+BukkLdGytH4Mcy+xQC6j1c8CcuybCiQ/uh75VP/3n9QxKGfSSxqzIUdW7YNtU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b=dh88dYmP; arc=none smtp.client-ip=209.85.166.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b="dh88dYmP"
Received: by mail-il1-f171.google.com with SMTP id e9e14a558f8ab-42576a07eeeso4626585ab.0
        for <spacemit@lists.linux.dev>; Sun, 21 Sep 2025 11:58:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1758481132; x=1759085932; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=t3yODI1opb0jOanIEDnISA0XED16oP9HRbOj2aYoSYs=;
        b=dh88dYmPz3MJVNeTIO5CBuSnmXGt+Ff3JBCY5wkqoEn4y+FXXdIqxSgVTMHjdhhubn
         srHj0YzlTGMjiwC1jKe2AVRnWJshIgW/vZyjB/1HsN8aaqdwPdAyIegB327ayFmUx3ap
         AuQBH1VDwivhL8KXz/1HOvQb5Wp+fSWKOLdBHU9Xie1rVTwbJrmcBRYpGmWGTy9MnRtU
         cQrk3c38WGrATVbqKctOPZfN5FZq1rju+Onf+SpjToqmO6dtt2pPnwNUSOiMDsmejVPR
         mQNFPP04a5q7uBdNlrEWCKH2fhmM0UrGW9lg2P5nUwx6tu8pTHaMlgajLC7+81uPmp5R
         4Wog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758481132; x=1759085932;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=t3yODI1opb0jOanIEDnISA0XED16oP9HRbOj2aYoSYs=;
        b=HXQ668JhXgx+3PxJ/nZoijJBlawvswm0bxW2jis4sm1HQdDEp4OLLrwt01TL5WHUP2
         E/VWmHOivwLiokFGvi8M5yCnRZWKiSbsvA3MaON3Xijr3MVVuET2a0x8g0Z+QyACLiXT
         fGs3YGPd37ai46hFnNDMEqQ1SZD7NvxtLk5Mznl5B/zZuILkxnN5oUrO8YW0Z20YLy9d
         yXE0i5Sngo333GNFN5Uds8fkt6yCglH2So5CIoXFANvzD0cCPHZ5tDaJod0DEn8LiHVN
         0JXqCkJ4gCm/6MTf/quSAz/WBnPK9XLc6HpbLqYR6bAlrZPMpxkGY5LscpsofCGG/QCK
         PBCA==
X-Forwarded-Encrypted: i=1; AJvYcCXEJhN1bJEWY7BoS/5Rf28yAg4LesGN/05Nz2PEn1lnHuT3/ArXDCtUjJfd4vH1JENPxN/uU3dbeA==@lists.linux.dev
X-Gm-Message-State: AOJu0YxJhSG7LZhft95pJYJRUN1hXi2pYWwAlkwtYw3EozAAxh8jFnZL
	uHcupUudRmgqAokzYeRC+3F0RJuvatyuJ+kPiUpSSWwbcb3x5giX2LQfq54sZ3rK8WA=
X-Gm-Gg: ASbGncutv985u/7QCVQQK99mkzEPZTZAa3rYyeoQb7cS546Ngup8P+rE2UuT37vhRkX
	X7OFwo+h26oe35b27KxNQ0WJIuNOTZad1j+h6jZahPsgAsBS69y4y4Jks3bFtFmU/4jzzNVGEsH
	MC/Y7nOdI5k680rAm72ffNGU9Wv1Jiin21ZfYL5B0j+PivzdVAr1x5DI9eoWW2lMqDID7h9t4NK
	A04tCc+Q5nKKakiUk+UJTnbyBCSqxm5QazwmgG46aib5KDAsiUR37SxGjTs7cbON4HnQyKHGrBi
	XSH1zfOv1N8mewTnVXulxo8p2srEd/WMrigQ1mcAbnyYbxgC29mLaxu9Y0dx1yDSBqrRV5K+pm7
	aLV99s9tWzt32JoVW5RsvmRwafpEqGVG1lu2MEMJtOA9KhpBioeI60KzENx5T+shzV3HczJo=
X-Google-Smtp-Source: AGHT+IEFYJsSo8XIdBpCssdirvu4z8vm7oDZUP42OyCCbdIOLRYBgINTidn4zPRPHizJvfN5lbHIOQ==
X-Received: by 2002:a92:ca09:0:b0:424:ed48:9acd with SMTP id e9e14a558f8ab-424ed489bb8mr86349525ab.27.1758481132441;
        Sun, 21 Sep 2025 11:58:52 -0700 (PDT)
Received: from [10.211.55.5] (c-75-72-117-212.hsd1.mn.comcast.net. [75.72.117.212])
        by smtp.gmail.com with ESMTPSA id e9e14a558f8ab-4244a36aa66sm49663255ab.8.2025.09.21.11.58.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 21 Sep 2025 11:58:52 -0700 (PDT)
Message-ID: <84c77e62-93f7-4a3e-8a86-7f653076bdcd@riscstar.com>
Date: Sun, 21 Sep 2025 13:58:50 -0500
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/3] spi: spacemit: introduce SpacemiT K1 SPI
 controller driver
To: Vivian Wang <wangruikang@iscas.ac.cn>, broonie@kernel.org,
 robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org
Cc: dlan@gentoo.org, ziyao@disroot.org, linux-spi@vger.kernel.org,
 devicetree@vger.kernel.org, paul.walmsley@sifive.com, palmer@dabbelt.com,
 aou@eecs.berkeley.edu, alex@ghiti.fr, p.zabel@pengutronix.de,
 spacemit@lists.linux.dev, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20250919155914.935608-1-elder@riscstar.com>
 <20250919155914.935608-3-elder@riscstar.com>
 <a7070f3f-8857-4834-9e9e-02068637075c@iscas.ac.cn>
 <3c9aaa62-f685-47f7-a21c-00f51550f185@riscstar.com>
 <411ade91-3fb5-40a3-baca-e6b03c5783ae@iscas.ac.cn>
Content-Language: en-US
From: Alex Elder <elder@riscstar.com>
In-Reply-To: <411ade91-3fb5-40a3-baca-e6b03c5783ae@iscas.ac.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 9/21/25 1:51 PM, Vivian Wang wrote:
> 
> On 9/20/25 23:59, Alex Elder wrote:
>> On 9/19/25 10:52 PM, Vivian Wang wrote:
>>>
>>> [...]
>>>
>>> +static void k1_spi_read_word(struct k1_spi_driver_data *drv_data)
>>> +{
>>> +    struct k1_spi_io *rx = &drv_data->rx;
>>> +    u32 bytes = drv_data->bytes;
>>> +    u32 val;
>>> +
>>> +    val = readl(drv_data->base + SSP_DATAR);
>>> +    rx->resid -= bytes;
>>> +
>>> +    if (!rx->buf)
>>> +        return;    /* Null reader: discard the data */
>>> +
>>> +    if (bytes == 1)
>>> +        *(u8 *)rx->buf = val;
>>> +    else if (bytes == 1)
>>>
>>> Typo? else if (bytes == 2)
>>
>> Wow.  Yes that is an error that I'll correct.
>>
>>>> +        *(u16 *)rx->buf = val;
>>>> +    else
>>>> +        *(u32 *)rx->buf = val;
>>>
>>> Maybe
>>>
>>>      else if (bytes == 4)
>>>          *(u32 *)rx->buf = val;
>>>      else
>>>          WARN_ON_ONCE(1);
>>
>> The value of bytes will be 1, 2, or 4, which we can tell
>> by inspection.  At one time I had a switch statement with
>> a default, but I decided to leave out the default, which
>> won't happen.
>>
>>> Just to make the pattern consistent? Same for k1_spi_write_word.
>>
>> Consistent with what?
>>
> I was just thinking it would be clearer if the code states clearly:
> 
>      1 -> u8
>      2 -> u16
>      4 -> u32
>      anything else -> shouldn't happen
> 
> As is, it wasn't obvious to me that we're just handling 4 as u32. Maybe
> we're just capping it at u32, and 8 is also handled.
> 
> Well, maybe I'm just not familiar with SPI stuff, and word size above 4
> doesn't make sense anyway.

Understood.  I only know it because I checked.  And I do want my
code to me understandable, so I'll add a comment as you suggest
below.

Thank you.

					-Alex

> 
> It could also be a comment
> 
>      else /* 4 */
> 
> Just a suggestion, no strong preference from me.
> 
> Vivian "dramforever" Wang
> 

