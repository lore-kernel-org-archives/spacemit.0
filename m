Received: from mail-qt1-f179.google.com (mail-qt1-f179.google.com [209.85.160.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA17527CCF0
	for <spacemit@lists.linux.dev>; Fri,  2 Jan 2026 15:42:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767368553; cv=none; b=uqjxZ6sUUfzqRzJ8WfuiMKZG7wwjbjygGHOcvfZATsltAug4FN9DsvXWvx7s2BQh3lfMesQT6oxTXootSpaOCPj2S+qWFL+fCPht+pLU4mf5IllXrnsgM+ZuWb6QX6eF3op8uBD50dlCh5gwgBecI5tKVFyzmhmcnFg7NSdoT8A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767368553; c=relaxed/simple;
	bh=9fLuRCFFMaVEtZXeKLAir+rC4rOYTMPaqOnYEmL1WAQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=QwFW/1LXNBfP8e6t7yHq5AgBCuCWlEEouQL40yqfFEvFLkkBWURiMiXhyEZdIul2Z2k/EbTrT1p9D2fxQj0MSIuLx1ddTmFF8n/e0hxoq7i+RX2XF9V9qdrhm/21Pc0JAAOfZ1LcV2gvNBa+Y8Ldm9EJHGuo4bu0KYLWf/cesWE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b=c+0TnncR; arc=none smtp.client-ip=209.85.160.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b="c+0TnncR"
Received: by mail-qt1-f179.google.com with SMTP id d75a77b69052e-4f4cd02f915so60003191cf.1
        for <spacemit@lists.linux.dev>; Fri, 02 Jan 2026 07:42:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1767368551; x=1767973351; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=XUaW410yZnjl46gYHFzLMVokQz6be6dGpRuwVbnPCzc=;
        b=c+0TnncRYpoY3J/ID47T8HFboDKkS4H2933uhp7AUTDWZXVwhCKT2fBKAtb2aosi8y
         HaaaHsIqwxrZop6gXLm1dFkGuM3DCjvpxiP3cRiXAOFb3XMLQ1VCH3xI31H1LuDnG7Yf
         iq2az0AXlTqO9W82IOiekOgzuRrlGisvVWp0jPjvc0tR5dhqbDk0BZO44LHpVbwIWH9H
         ajSwue9NxkHSD5raTnNerG9T1crEsIEDltv088UuGoi0TICq6XWhxFatvPKXZ5E2zBuu
         y0t1X3uMK+3qcjVbk1TrUdACdvIkqZkf/rBlD9QZk1cm0jcpFEQd57US4JOekiEGE7xp
         twow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767368551; x=1767973351;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XUaW410yZnjl46gYHFzLMVokQz6be6dGpRuwVbnPCzc=;
        b=MEFtPJen+Dvo2XX0OKHsa+HIi9aj4NH1xkaxjiYkWIbaOA4MHAp69gG2hlU8Yakl0d
         j8WGJRb15nyvd+bCSb3wi8bkOzcY/cNNcHQyRhuRVOq2PWlqxz+ml7P54EWATq/UuHbq
         vnQ+4p/ATEK2UrMI/uIRbo4uggeKPr6btKg+FVU9EZspddx8f/1oSGUZu3CfLzsurc7T
         Ug27f0k5eucaXAPdK8ozmFt9RHUppYP53sb6QbgdBxvYVgcgmBek6LVcu3ZSXQtx1zED
         b05FefXlHlqndSwZyXcsMv6l8IZJTCFqVsoIeTG7+ppVynamUQ7JGRZZLwnG3mY+hvR7
         GfRQ==
X-Forwarded-Encrypted: i=1; AJvYcCVOrx/TwY4WFppK9VCzdxC0HAh86JdcdThVtBIZXy/E4nImhX0pareu2jQ1d3INA/8/A8Tl17hTKA==@lists.linux.dev
X-Gm-Message-State: AOJu0YwRKGJxwY2YyuRDNua6jSVNhCyqqgNvgCtHBdfgBWR0EUuFklWl
	G+dVoflYFcDMb6cJ/3s2j/X7KDM4v7BD2aAQL/aWcTX35GXkhI1AZb7BJcrsZF6ZUvM=
X-Gm-Gg: AY/fxX5nEV32aS4pGn+bXLGvlLPotE3++6ANx6O8/jQqfFXfJAM7F3CNuwdATCfE9IJ
	3oTgO8cxB3LvZGgpAO1jSsHivs4VXkpnyuGpJsF6W/gEb9Ja3psl58K40mVdh75C40RcGLRL63G
	iiKduE6IxrZPpXq4hS94sf3v+uabnzaASB6uvcpTxxYK0S5qHNo8kYus2v9ESE9rviPcR0rZLBG
	ZVcW9Rfk2IX1iVKHIvYt7N6MIwTFjPhL29uAjWWgAkkrwtmZ4j0ogoXvYg+VJV0U0lpeecbdzZ/
	Mf0xRENQpfHyJWplDZY+fhD4om4i8pf3H4aFkaQb5i27RzLYvMkyzeMHC7fU2IjmmxRUvCrMea1
	SZKRaVTvlthOjBsOY0096UXy1qmjel4TDfwWzT6d27pQNGPLfr6Dm+t4ElHBpsY5eo7CDWLYw94
	Rk5p2JK9YbS7GtYAhCvwOxTprWRnVbKdzg1Dz+F3wulvnj610TBFc=
X-Google-Smtp-Source: AGHT+IHtEl+Nsh7Sudx4gNAqVHpF5lV6u1SdMvxxbZdekk0b4Vk5JFG+dPcCu/VVDnvDpxsq/g1ikQ==
X-Received: by 2002:ac8:6044:0:b0:4f4:c150:7d1c with SMTP id d75a77b69052e-4f4c3ebfe26mr437680291cf.53.1767368550594;
        Fri, 02 Jan 2026 07:42:30 -0800 (PST)
Received: from [172.22.22.28] (c-75-72-117-212.hsd1.mn.comcast.net. [75.72.117.212])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-88d997aeff4sm326161116d6.29.2026.01.02.07.42.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 02 Jan 2026 07:42:30 -0800 (PST)
Message-ID: <8241a2a0-62e6-4708-8cf6-58d0a59476ff@riscstar.com>
Date: Fri, 2 Jan 2026 09:42:28 -0600
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/3] reset: spacemit: fix auxiliary device id
To: Yixun Lan <dlan@gentoo.org>
Cc: Stephen Boyd <sboyd@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>,
 Philipp Zabel <p.zabel@pengutronix.de>, Guodong Xu <guodong@riscstar.com>,
 Inochi Amaoto <inochiama@gmail.com>, linux-kernel@vger.kernel.org,
 linux-clk@vger.kernel.org, linux-riscv@lists.infradead.org,
 spacemit@lists.linux.dev
References: <20251226-06-k1-clk-common-v2-0-28b59418b4df@gentoo.org>
 <20251226-06-k1-clk-common-v2-3-28b59418b4df@gentoo.org>
 <546ab443-d0b1-4f21-856c-c74e84511d06@riscstar.com>
 <20251231020951-GYA2019108@gentoo.org>
Content-Language: en-US
From: Alex Elder <elder@riscstar.com>
In-Reply-To: <20251231020951-GYA2019108@gentoo.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 12/30/25 8:09 PM, Yixun Lan wrote:
> Hi Alex,
> 
> On 18:50 Mon 29 Dec     , Alex Elder wrote:
>> On 12/26/25 12:55 AM, Yixun Lan wrote:
>>> Due to the auxiliary register procedure moved to ccu common module,
>>> the auxiliary device id need to be adjusted, otherwise reset driver
>>> will fail to probe.
>>>
>>> Signed-off-by: Yixun Lan <dlan@gentoo.org>
>>> ---
>>>    drivers/reset/reset-spacemit.c | 2 +-
>>>    1 file changed, 1 insertion(+), 1 deletion(-)
>>>
>>> diff --git a/drivers/reset/reset-spacemit.c b/drivers/reset/reset-spacemit.c
>>> index e1272aff28f7..8922e14fa836 100644
>>> --- a/drivers/reset/reset-spacemit.c
>>> +++ b/drivers/reset/reset-spacemit.c
>>> @@ -278,7 +278,7 @@ static int spacemit_reset_probe(struct auxiliary_device *adev,
>>>    
>>>    #define K1_AUX_DEV_ID(_unit) \
>>>    	{ \
>>> -		.name = "spacemit_ccu_k1." #_unit "-reset", \
>>> +		.name = "spacemit_ccu." _K_RST(_unit), \
>>>    		.driver_data = (kernel_ulong_t)&k1_ ## _unit ## _reset_data, \
>>>    	}
>>
>> The above macro is named K1_AUX_DEV_ID().  Why don't you
>> define K3_AUX_DEV_ID(), which could use "k3" in its name?
>>
> that should also works, the idea of using same macro '_K_RST()' here
> is trying to explictly tell users the clock and reset shares same name

You mean like "spacemit,k1-syscon-mpmu" is used, and you'd rather
name the reset "spacemit.k1-mpmu-reset" because it sort of matches
a little better than "spacemit_ccu_k1.mpmu-reset"?

Anyway, when K1_AUX_DEV_ID() was defined, it was named that way
to suggest a pattern that would mean K3_AUX_DEV_ID() would also
be defined.

I don't really care where the "k1"/"k3" goes, before or after the
period.  But I think the "k1" could be encoded explicitly here
rather than doing it with _K_RST() (i.e., don't even use a macro).

					-Alex
> 
>> Anyway, if you go this route I suggest you drop "K1_" from the
>> name of this macro.
>>
> or could further refactor the code, to make K1/K3 drivers share same macro
> 
> anyway I don't want to change this patch, my goal here is tring to fix
> reset driver after clock common driver refactored plus the modularization
> introduced, it's more proper to leave those refactor work up to Guodong,
> since he did a lot adjustment to add reset support for K3 SoC
> 

