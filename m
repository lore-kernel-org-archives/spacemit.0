Received: from mail-il1-f177.google.com (mail-il1-f177.google.com [209.85.166.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 589ED303C9F
	for <spacemit@lists.linux.dev>; Thu, 18 Sep 2025 12:00:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758196807; cv=none; b=plAGg+Fpa3nazqD3bCw5B2Yf66dbR+FziOwiqEsDZdeVLHGV6I1edAmBDef0LEIis4XbsLJGkLPWTFpVCkvWYUFsJL65xAkmWQJ0zhjU3Q62mrpo5GERbahaYUsUqIeWmfdrCQ+BAnKOKPkCiGPfPyPt3jJwJh3Z8iaHurV6S1I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758196807; c=relaxed/simple;
	bh=BiCnS6nvRQt9QJIQu21OOgBTBUSKKpEDfAYCnnRz0ZY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=nEJY/6c4u4GqMi8G0eu5qgiP2Ai66SMh7jPQR6Ng2WZywG31MW3/Bl2pZVVVMJLCdanNHaC9VxyuLjZlbXnfbUm/UZaC7S5VJM2PIzpE4E/egUbjXNRpAfkRRTBa9vU2vvV8KTplYbgJFj+2F2SO/Zpu6HYturbgJkstQPbqPaw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b=rgcZBYXw; arc=none smtp.client-ip=209.85.166.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b="rgcZBYXw"
Received: by mail-il1-f177.google.com with SMTP id e9e14a558f8ab-42480cb4127so152905ab.1
        for <spacemit@lists.linux.dev>; Thu, 18 Sep 2025 05:00:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1758196804; x=1758801604; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=24dAp6S0Mw7uy79hEDvqIYLysQ8ECFwST6qu+5oIS60=;
        b=rgcZBYXwZ8I80rpinw7KVZP4FRgaGz65mfV+9v4JpWEAA/4etq/NsOihb0BNa1OJ3d
         pe2AepTnFIjaE6InLCEImI6YWHN/eQ/HNlX585K3mzZbgMSXbkFmhMTAGiXqYGwcw7H7
         HSbPHJofNR+qN8xOf++bD6S02SiXaAkoY9GXmhySBjyazQgDLRlITNINrGhDsn6+JwOO
         ualzz15rizG+92zj2mD4ruIwEubgoWQnprS811tQ5hLSfpVJQnvIQdPVfpLVc4dgSl4u
         +DmKCzj6mpbZU+ACs0lB9YtXYsa91Or//h5SCPrnF0J9vaGQA2zKMUENGb1ETFYAPuAp
         bLPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758196804; x=1758801604;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=24dAp6S0Mw7uy79hEDvqIYLysQ8ECFwST6qu+5oIS60=;
        b=FRg5ffV5TgBWyC8CoqGJDmde+Cy2/DSZlzwfIuoXLlRXYe3tY3VpIgM++l2PR/rOOG
         GhKpIdXOq4/LzB86R8lOSE/PI743s5CKVcQEMoCay++RH7l0iKQvVbqeK4YxPGfgj+Hc
         5i3b5jMtMpwHmLWzx2ApIe6F1Yjm1tuSQnBE3BluCtUaF7EPMW8OUK9/2NLS6VG+c8Qv
         ENr8AyLnkYRMxi5fVkxaqbtJ8whpg0HA2hcan6QJyxwjn00cVXXVjHPu+vpCUWrGNUyW
         w86kQEQcxGCoFOejh92+tZLTATVrMvwLlt+ZbnoOCxRroGyRhkUcOHpAt9J+11FcJTpR
         mKZQ==
X-Forwarded-Encrypted: i=1; AJvYcCWWtFHjF58yb0dnwj8ocYUEhSFvQpuBzRrEz1YmC/ScljvxjdncEb4A3i5cxgzWIlTahFaRRB8MkQ==@lists.linux.dev
X-Gm-Message-State: AOJu0Yxj/xVBOfsPgrZW2I4GChDW7a+9rZfz95uuCct0RXz0jnon3Tk3
	uhTxNik4kR67H/i0yfd0CrBnvVX/Meluc9d5sj8yylYL+WjOS+gYd4jxoFTBc/cvYys=
X-Gm-Gg: ASbGnctIpzPr0QkIAAXCnBn4qHDG9h2tGA1ceiqoHigoqu5ZsgKkoGzjNPma2gUsATY
	sgRiOuWwPs7PRCPWBQt4/qaRQn8xCZChdbz/+F3yXQK21Ovf2uuQDx2FpFEz6ry0qJEt3igKg/W
	Hhq7KmNVWoZVzG0ptyP8H7kR+0sSO0PPIILi4YSJN4+ubDwPfOJKf+v1C77OxSNpeXIhYPWQdEe
	J1TjIPpe97ZrFMyHn1HlHSHrNzptFWpuq36JGiIqklVOuVqEfTXUkMRq0kDm3rZvn4AgFLHz1nu
	3m1ubhpSqLbxl6fYsdt50OAW2bO4bKhcQCoGNe7qO82wfPZVdj15bVwubS9vL/JO0jUvGtV2bOp
	ThF4agsM0oP3009O1RNUO4hNCE1f24nPfKvV6FQAEaiy7DmClWbQwbrJGQOUOFpeXc1muRYe5vk
	ae8u0zQQ==
X-Google-Smtp-Source: AGHT+IFijlR8XeEU0nDd9FqF6SZxYszafUFzoDoP3bqBLd4TIHjKMZRHmvYVFqpT9XVP5Gq1Y4eDhw==
X-Received: by 2002:a05:6e02:1707:b0:424:485:1f03 with SMTP id e9e14a558f8ab-4241a4d26ecmr81727265ab.13.1758196804240;
        Thu, 18 Sep 2025 05:00:04 -0700 (PDT)
Received: from [172.22.22.234] (c-75-72-117-212.hsd1.mn.comcast.net. [75.72.117.212])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-53d50aa5dc6sm876180173.47.2025.09.18.05.00.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 18 Sep 2025 05:00:03 -0700 (PDT)
Message-ID: <88833bd7-dad5-4613-b29e-2db05d60f3f0@riscstar.com>
Date: Thu, 18 Sep 2025 07:00:02 -0500
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] dt-bindings: spi: add SpacemiT K1 SPI support
To: Troy Mitchell <troy.mitchell@linux.spacemit.com>,
 Yixun Lan <dlan@gentoo.org>
Cc: broonie@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, linux-spi@vger.kernel.org, devicetree@vger.kernel.org,
 paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu,
 alex@ghiti.fr, p.zabel@pengutronix.de, spacemit@lists.linux.dev,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20250917220724.288127-1-elder@riscstar.com>
 <20250917220724.288127-2-elder@riscstar.com>
 <20250917231520-GYA1269891@gentoo.org>
 <3b815302-21f2-4ee2-bf83-c1dba77ce3d1@riscstar.com>
 <20250918001632-GYA1270371@gentoo.org>
 <f7e12797-ea17-4e92-bd25-cc562c66d2a7@riscstar.com>
 <D2A109C6A8BDED08+aMu4H4xap2GSP50w@LT-Guozexi>
Content-Language: en-US
From: Alex Elder <elder@riscstar.com>
In-Reply-To: <D2A109C6A8BDED08+aMu4H4xap2GSP50w@LT-Guozexi>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 9/18/25 2:43 AM, Troy Mitchell wrote:
>>> while looking at the code, it seems you can use alias to map specific id
>>> to the spi controller, it even can do non-linear map, something like
>>> 	spi0 = &spi3;
>> I've never used this before, but yes, it looks like it's exactly
>> what I want.  I'll just get rid of the "spacemit,k1-ssp-id" DT
>> property entirely.  Easy.
>>
>>> plese check of_alias_get_id()
>>>
>>> note, I haven't actually verified on board, just look through the code
> This is the right API that Alex what to use.
> I have verified it in i2c driver.

Yes, thank you for confirming.  I've already made the change
and verified it works as desired.

					-Alex
