Received: from mail-io1-f45.google.com (mail-io1-f45.google.com [209.85.166.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1BB025FA3F
	for <spacemit@lists.linux.dev>; Mon, 24 Mar 2025 12:52:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742820774; cv=none; b=DBgnuXNaBs1VSCVkuqqw65BJ7umhkNzL4YYLYh7iQWehfesYLhFKHuLXc5kwMtu+rQki4k3r2fEbby9QmFA7FPD/Q/2J64J6tpad7phHx5/h4qASqN3CTopJOFe2I+eYCj8hTkt/bOKzhKr4J9gqJYCpafQBqn4MYlesI2HfW88=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742820774; c=relaxed/simple;
	bh=tZeyOMnQsNvDDiIiuNWxW+4BJjKY29h3V6qQ1S2MzuU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=iJ88A9AH86UWIWZIPmbhrKSOAfHJkTL1Yxftgm+Doq6IGljVwOWkEvlmXwbRg9vZ4gct4jhcSp0AnfbUe1PBiGFWon2qnW1M0AatKW8egkvlUuXrtkxO0CHwwnfxpQk+o3Z162xBbabKE8kA9fs8KamNkZKNjIS9igXxwy55/LI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b=1DSqu5aR; arc=none smtp.client-ip=209.85.166.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b="1DSqu5aR"
Received: by mail-io1-f45.google.com with SMTP id ca18e2360f4ac-85de3e8d0adso42256139f.1
        for <spacemit@lists.linux.dev>; Mon, 24 Mar 2025 05:52:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1742820770; x=1743425570; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=6X0oWdoPDnrM5Ggl2vFdtnlylP4PXBXYERzQLRD3cjM=;
        b=1DSqu5aRc5RqvTr+qDY8u+DgH7LVUw3EMiJLyDDa5ls3OFxZbz4GY3R8pCEYIQmnYe
         ifzHLQAb4pXgSjwLDgD6UglWmEknFZss5MMA85P2SCD6ral3hG0vzPnTUhbQ97eq7JKz
         v+JdbNi1efBMFFZY03bWDtTH8zcRkGq/TusfZf9lVO8wPi/sdssWsQuHnQ14SoVrhg5s
         EkwN9JmduLZ1bHIFtoDO0Zv09XK98LrW7jPDBAoVhHovbsZsUOK6B1JZDBYGX2QfQoZw
         ETiEm5dJ7Pv/UELMl7/VFmwkHsswuLqDn5LwHOUpt3BtiHYHcmH5sOvYuI8mGpQg4EY1
         LniA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742820770; x=1743425570;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=6X0oWdoPDnrM5Ggl2vFdtnlylP4PXBXYERzQLRD3cjM=;
        b=CNg3f5h82O/kQ4zDr9wXVDxxJns4/TOHqvkZxHo4lAq2IDZTnw4CaX2t9XElH3LnMJ
         VR4IPPwJEnEWSLBVl29bcSZTiU9lJ894ZshZ8oDJkluZXq27mbvQlvWLyN3g7yB841Cx
         SJFCMJYtwWkLNtP/sVPDsOMGFVstjANK1vNbl0Twc8N3Wxbg6FQ6AZADZlWT+nEa1f6J
         1mSecioRL9zme6/uKg4Hm35+3hAJQBEWNd+Qbg8vCm+/RQwmPd5aC4WFQEmOb5Nj8HzV
         FGCEXRzsXfQT4V61Qo/y5ILH1q8a3cPDzKHIJ44ZiDbiG7nyCefS/LxbIlHReaKa1kud
         /I5Q==
X-Forwarded-Encrypted: i=1; AJvYcCVB+FNjg3p2JgFbejYV2MUqmEsg+nDss/cYnNfBVSOkAPy/6EH4ceNzAARpmpzNX6n5zEJfOUnatQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YwtB90FMJXmm8MOdbv63Bie4gZDA60DknvuCo1gycIGY0cJ2Z0U
	IGj4Eyt3mmgHcfWoz9z5NVbGtdPEGqVt/v4JwKWJhMYTJvyJUE01j5WD48KFm1Q=
X-Gm-Gg: ASbGncvOoDF//6PTELEkEf4IRLcNFWw/lL8vugMKunNj1SQhKgiojYPO1qOFYChEHrw
	VmsivLLDISaqO3RlVnRyWJreJI6jrwTTAn1henH6xoUtw+gUR4md3us+TquOXtYPJUgP2Yt403H
	0kC5oV61KcIpRA7ZtXGFLFyRF0dU/9hQnItc3/BVaqZFc5XGK8xTwWERIQkrVjCXx1pY2+qcCD9
	cLaHFjfiyFsxZowuLcZjF1aqEgdafwbU/bBJd84wdP4MXFELVPRXP4zaniRpVGxnJC+uG0so6Yn
	lp5fUC6E7tdMvOXslVPwXe85kO/P1+bZBmpeXYUw+fAEEZZmJfCphwJX7htZBaI0giTZbo71Aod
	hhmwS30bu
X-Google-Smtp-Source: AGHT+IGosqVsP6xD9EOhI7VXXnx9Y+44HitNgUDbYxTirUwdX5Z/bTtbV3lrW2oS8n5r7ikaiZEZ7g==
X-Received: by 2002:a05:6602:488b:b0:85b:505a:7e01 with SMTP id ca18e2360f4ac-85e2ca364aamr1471217539f.5.1742820769907;
        Mon, 24 Mar 2025 05:52:49 -0700 (PDT)
Received: from [172.22.22.28] (c-73-228-159-35.hsd1.mn.comcast.net. [73.228.159.35])
        by smtp.gmail.com with ESMTPSA id ca18e2360f4ac-85e2bc273b7sm164604339f.19.2025.03.24.05.52.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 24 Mar 2025 05:52:49 -0700 (PDT)
Message-ID: <b9af5eec-db85-4465-895f-d7781ebe9dd9@riscstar.com>
Date: Mon, 24 Mar 2025 07:52:47 -0500
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RESEND 3/7] clk: spacemit: add reset controller support
To: Haylen Chu <heylenay@4d2.org>, p.zabel@pengutronix.de,
 mturquette@baylibre.com, sboyd@kernel.org, dlan@gentoo.org
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 guodong@riscstar.com, paul.walmsley@sifive.com, palmer@dabbelt.com,
 aou@eecs.berkeley.edu, spacemit@lists.linux.dev, devicetree@vger.kernel.org,
 linux-clk@vger.kernel.org, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20250321151831.623575-1-elder@riscstar.com>
 <20250321151831.623575-4-elder@riscstar.com> <Z-FOJFHOsU_dLkmS@ketchup>
Content-Language: en-US
From: Alex Elder <elder@riscstar.com>
In-Reply-To: <Z-FOJFHOsU_dLkmS@ketchup>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 3/24/25 7:20 AM, Haylen Chu wrote:
> On Fri, Mar 21, 2025 at 10:18:26AM -0500, Alex Elder wrote:
>> Define ccu_reset_data as a structure that contains the constant
>> register offset and bitmasks used to assert and deassert a reset
>> control on a SpacemiT K1 CCU. Define ccu_reset_controller_data as
>> a structure that contains the address of an array of those structures
>> and a count of the number of elements in the array.
>>
>> Add a pointer to a ccu_reset_controller_data structure to the
>> k1_ccu_data structure.  Reset support is optional for SpacemiT CCUs;
>> the new pointer field will be null for CCUs without any resets.
>>
>> Finally, define a new ccu_reset_controller structure, which (for
>> a CCU with resets) contains a pointer to the constant reset data,
>> the regmap to be used for the controller, and an embedded a reset
>> controller structure.
>>
>> Each reset control is asserted or deasserted by updating bits in
>> a register.  The bits used are defined by an assert mask and a
>> deassert mask.  In some cases, one (non-zero) mask asserts reset
>> and a different (non-zero) mask deasserts it.  Otherwise one mask
>> is nonzero, and the other is zero.  Either way, the bits in
>> both masks are cleared, then either the assert mask or the deassert
>> mask is set in a register to affect the state of a reset control.
>>
>> Signed-off-by: Alex Elder <elder@riscstar.com>
>> ---
>>   drivers/clk/spacemit/ccu-k1.c | 93 +++++++++++++++++++++++++++++++++++
>>   1 file changed, 93 insertions(+)
>>
>> diff --git a/drivers/clk/spacemit/ccu-k1.c b/drivers/clk/spacemit/ccu-k1.c
>> index f7367271396a0..6d879411c6c05 100644
>> --- a/drivers/clk/spacemit/ccu-k1.c
>> +++ b/drivers/clk/spacemit/ccu-k1.c
> 
> ...
> 
>> +static int
>> +k1_rst_update(struct reset_controller_dev *rcdev, unsigned long id, bool assert)
>> +{
>> +	struct ccu_reset_controller *controller = rcdev_to_controller(rcdev);
>> +	struct regmap *regmap = controller->regmap;
>> +	const struct ccu_reset_data *data;
>> +	u32 val;
>> +	int ret;
>> +
>> +	data = &controller->data->data[id];
>> +
>> +	ret = regmap_read(regmap, data->offset, &val);
>> +	if (ret)
>> +		return ret;
>> +
>> +	val &= ~(data->assert_mask | data->deassert_mask);
>> +	val |= assert ? data->assert_mask : data->deassert_mask;
>> +
>> +	return regmap_write(regmap, data->offset, val);
>> +}
> 
> I don't think it's safe to write the regmap based on a value read
> earlier without the regmap's inner lock held: it's totally fine for the
> clock part to issue an update of the register at the same time. Without
> knowledge on it, reset code may rollback the clock bits written by clock
> code earlier to the original value. That's why I keep using ccu_update()
> everywhere and dropped ccu_write().

That's a great point, thank you.  I'll modify it to use
regmap_update_bits(), which is better anyway.

					-Alex

> 
> Thanks,
> Haylen Chu

