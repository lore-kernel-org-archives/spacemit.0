Received: from mail-io1-f45.google.com (mail-io1-f45.google.com [209.85.166.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0AC4F1AB6F1
	for <spacemit@lists.linux.dev>; Tue, 13 May 2025 20:36:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747168574; cv=none; b=WOBIhV9vonHS7hywhFjQ+QUf8XR+U39FigEJGglSjftVAcw1iYyYa7dk7YRkWHjPuwjqpvjcHZNWb27Gvx3+adfgoJvv47Y0aFD1Y/1vDG5hkXDg+1VQsj5L0MofEApL0vRiLZ4TtUzbbDEwUn0POFQry7cQeHuahwTebrUIkAg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747168574; c=relaxed/simple;
	bh=5LLRBHA4RbQdiR5KNtH8yV15ZdswH3CB9WS90/GuQhs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ejQZ2qHX4SHhvvBBfv58J/43wxMsMFnwYquK1aEKlkAQ9pn005i21rMtVmgBvrPzzGwvOmVmqiz90OHutmEDurImb2opG8xxkzQ/HwmpJEN4v+a40nMJPSSKuknGztNrlbEDcxxbIRxzsbrsS0BuWHzDTU3xybbg8o4MIK4ANMw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b=iRCPhlcR; arc=none smtp.client-ip=209.85.166.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b="iRCPhlcR"
Received: by mail-io1-f45.google.com with SMTP id ca18e2360f4ac-86142446f3fso160850639f.2
        for <spacemit@lists.linux.dev>; Tue, 13 May 2025 13:36:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1747168571; x=1747773371; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=vQAC3le+BCYy2YLab53jAJm9W1rrEw9K9lEKqtin1Pk=;
        b=iRCPhlcR0nPTGveP5wThCR9m71wVETT+qXM6iTabosg1zTJctzC6H38GfM3LwuVflr
         vw9IqC8P1n9hcKu+qxmeGeUO7d1TnHfwWmHMt1Bg8q3hVCaak7upHNRA0wNn0fuF0QsI
         Oc22FwwHlRNR4aLLg7wtbcY/8UHw6SPgGSc3CSjgPK23Oe8yBDxpBnoxe0yndv6MHlMV
         h0EjZNNX4dkoYMwyLYscFQVWUwJl+oOHdh6IqCqr1wQhlORYhokWi1EzzgiQv87cMTNC
         OGpeQSw0NLYuv6FQ1g/s7I2n4HPaJRDTJ/p9Nw+6eGb2+VHSb6sTk1qQx+UTy3uALxnT
         vviw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747168571; x=1747773371;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=vQAC3le+BCYy2YLab53jAJm9W1rrEw9K9lEKqtin1Pk=;
        b=JwsinAB/7/89teT5WVNiXuO9TiU/UcLYjuaaV1Ze4eMGYPCpKeTEM2UBqpVYjWDYmg
         MeuI2tlDgk68JbxZRH/RMMvqELg/NCYsowCBdBPJdZKFsLQbTjZNHwlOUKtHsjV7xhnq
         LGURhcZOxbw41U+/AktlkKUXgKhaXHnEhKxaNF30yw/3LzGUZdGnu7Y39IFp4TKnwrXI
         /bei3a9pvk+kICNkAqUEhpdm2+ziY3L+pIYZghEW6nHfDCHkIzOV6WqeSkyX7Vo3W5zt
         8827nQWI4enJrlkxN5CI9u95T/PBHy7gYWdjWNc5crBDEmRIJm5Vd+bgPLXHfZYj+n0s
         8UMA==
X-Forwarded-Encrypted: i=1; AJvYcCWJqmU/ccb263pT9ldc1zx3vC9ZO4jlMt6v/AZpHD+NBEe9Jp5clDeTeuqLTQLK20FpuRY969SHEA==@lists.linux.dev
X-Gm-Message-State: AOJu0YzCYAhmqltB7filhYYZsByuuTDr3hZMv7e+obL5bDPcatFU5p+J
	fM6WiJWlD7Q0n5lqKm3eoq8+Fn3f8fU3iYNvmP7ygcJV6RrnI6y2ybgnql98pvQ=
X-Gm-Gg: ASbGncu8GfQT91ndLdwtnQNkJ9KnEDdQqjJaj2RHw2yqokOpcHOh8nNplSi+Ub9A2o/
	FBQaP+bZkDReLZ2CU40SnE2WAnzV0oyHxwwNmFYGt42BQWIep+/oSidnNBloZvQ2cOoSS7x5OsF
	aY22nJF+LzaZJSJknBeWxNq1SrsQLSp7bqNIU8XUd1DelwNfc12c9BlT+iWDKPi/oEDXalau7CD
	xtvrrV8OanpFfw8Em9f7PpNOUgLnRMDzbsIuucVYXmFVaBIVO8r7oPpxyOxP56RdnZ5h1RMp1Nu
	ZdJhvwgpwWZ6Do2mJ0edpeZ/ST5MBDvxRUonsNsDJVAjKU+KadXf3q5BLM9i41DpWJA25EvzKgz
	pZ/iG43Je9CkVCfc=
X-Google-Smtp-Source: AGHT+IGmcYzrawJPrdx830TjmfHvKcMCTm3YWEkQZLVMVtIRd+wF9lEoF07B//54gt57mIaMgWnBSQ==
X-Received: by 2002:a05:6602:6ccd:b0:867:237f:381e with SMTP id ca18e2360f4ac-86a08db2c12mr94293839f.2.1747168570986;
        Tue, 13 May 2025 13:36:10 -0700 (PDT)
Received: from [172.22.22.28] (c-73-228-159-35.hsd1.mn.comcast.net. [73.228.159.35])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-4fa22524b94sm2255602173.63.2025.05.13.13.36.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 13 May 2025 13:36:10 -0700 (PDT)
Message-ID: <62b44c17-442f-425b-bf9a-56c9d4eb2468@riscstar.com>
Date: Tue, 13 May 2025 15:36:09 -0500
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 5/6] reset: spacemit: define three more CCUs
To: Yixun Lan <dlan@gentoo.org>, Philipp Zabel <p.zabel@pengutronix.de>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 mturquette@baylibre.com, sboyd@kernel.org, paul.walmsley@sifive.com,
 palmer@dabbelt.com, aou@eecs.berkeley.edu, alex@ghiti.fr, heylenay@4d2.org,
 inochiama@outlook.com, guodong@riscstar.com, devicetree@vger.kernel.org,
 linux-clk@vger.kernel.org, spacemit@lists.linux.dev,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20250512183212.3465963-1-elder@riscstar.com>
 <20250512183212.3465963-6-elder@riscstar.com>
 <ecf46fa3116690b85f51539edf7f6a47c612fca5.camel@pengutronix.de>
 <20250513201208-GYA518096@gentoo>
Content-Language: en-US
From: Alex Elder <elder@riscstar.com>
In-Reply-To: <20250513201208-GYA518096@gentoo>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 5/13/25 3:12 PM, Yixun Lan wrote:
> Hi Philipp,
> 
> On 11:21 Tue 13 May     , Philipp Zabel wrote:
>> On Mo, 2025-05-12 at 13:32 -0500, Alex Elder wrote:
>>> Three more CCUs on the SpacemiT K1 SoC implement only resets, not clocks.
>>> Define these resets so they can be used.
>>>
>>> Signed-off-by: Alex Elder <elder@riscstar.com>
>>> ---
>>>   drivers/clk/spacemit/ccu-k1.c    | 24 +++++++++++++++
>>>   drivers/reset/reset-spacemit.c   | 51 ++++++++++++++++++++++++++++++++
>>>   include/soc/spacemit/k1-syscon.h | 30 +++++++++++++++++++
>>
>> Could you split this into clk: and reset: parts? The reset changes are
>>
> Do you have suggestion how we should merge the patch series in future?
> What I can think of
> 1) take patch 1, 2, 3 via clock tree, and provide an immutable tag
> 2) pull the tag, and take all driver/reset via reset tree, and provide an immutable tag back?
> 3) take the split part of drivers/clock/ in this one via clock tree

I discussed this with Philipp privately this morning.

This series builds on the clock code, which was accepted for this
release.

If I separate the clock from the reset code into two parts, we
still have two header files that have updates, shared by both,
so those headers need to be pulled in first.

I think the easiest thing to do--if Stephen is OK with it--is
to have the entire series go through the clock tree for this
cycle.  It avoids any need for coordination and will just
get things right.  I think there might be a trivial merge
conflict, and I'll call attention to that when I send the
patches.

I will explain all this in my cover page for v10 of the series,
which will have all the signoffs.  Philipp said he will give
his ACK.  We'll then see what Stephen decides to do.

					-Alex


> 
>> Reviewed-by: Philipp Zabel <p.zabel@pengutronix.de>
>>
>> regards
>> Philipp
>>
> 

