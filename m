Received: from mail-il1-f182.google.com (mail-il1-f182.google.com [209.85.166.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD1AE221DB9
	for <spacemit@lists.linux.dev>; Thu,  8 May 2025 20:04:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746734691; cv=none; b=d+3TP56LNjuVPlV1f/zVHNguSuHZAXXpkm3OLZh8B493gG9b+68PgbrmsghXLkKXqmRekFZvUXV+TZSpFG0a8RgXvOWUgNRSDu3zLV+vcjvtSxsOS663LURPKOrH+5qzzWLT5r1wX7mtn36w5mSeUTTIMnu2A/+IlMDW+3yoKc0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746734691; c=relaxed/simple;
	bh=clyZCS+y49UfoFWdDhvIwuMYnV42vxhXHsId2Em8rLA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=DR7OpSrlPYuvm1Ee78RkqbxrhYHd1wQQZGxKk4Fk6sbKeQmE79awj0XHu+rADpK5kBPTdeb5QM/B7Z7v8gcNYO1Zuz47Q5wO/o0tLxNlyLwqgc/rP03ZXhl6V+m3HVd+h6XFiQYfeXnDYK7OviQV7Qn5iGvAEfZDZnDI2/AxB0s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b=XtIIwHMv; arc=none smtp.client-ip=209.85.166.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b="XtIIwHMv"
Received: by mail-il1-f182.google.com with SMTP id e9e14a558f8ab-3da73df6b6bso4171685ab.3
        for <spacemit@lists.linux.dev>; Thu, 08 May 2025 13:04:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1746734689; x=1747339489; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=+BZjOLU7Mj7gmvFl5R7+Ucy0sGYtXH0NW6caQm2Jkt0=;
        b=XtIIwHMvI1Il33MeBkV/91pQdnaWirCGRFAGxNOz81N14e178Z6Ys8mf9vaVmlK2yi
         3K3hwAS+r5MEW7ByvtMSlQ072w3MKV/OC/EAHCc9htIWjHLki02zOzd5WdTN7c0s4/3E
         rmyjZwut3jJrpI0wlbHMNNe7LK2JVJLjZ0Ubpu1rdDUWrjaHuPZjMaCjDSSfLxmjJyOR
         DG2zXZRfHgMcVNxzrgu6dXREMKvC2hjRrLFCfyMItOR0XJ4Xr0XFCE+Ta89bNJg0vG1K
         3EpoBBuFyAP8i2Nu5sWQYW1z6q6mq58jECpnHmfdlsUtg8QzWjDt47ilNuJNiunXKzO7
         QaGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746734689; x=1747339489;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=+BZjOLU7Mj7gmvFl5R7+Ucy0sGYtXH0NW6caQm2Jkt0=;
        b=FIffK9vQraCs4IcZok/mSnABKBgde1q6w8amlBVcKg2HIUsFD4HrqjqdLptGmm1+xC
         kgxtZBuRzQi8J5AOo5XRwOgtwPHuE74mqT8esiHuhV10sAkm2uyMhm/W1MHEmtFdjKzk
         xv7hyhj9jAIwRF/gNcNU4licSGK0acS26Sx/l6XM/BB5vsok/TKvp5Ofko7wHjZlUHeQ
         C29jvvj5e0/NDIDwFdYR+Mm4cBKyA9vIdge9diopOUFyD2rlxjth8rrKlRPEYNX+y3BA
         aj1Gg+u429wmH2BttCyeSEXnSX1LP4qR7D8988P0aB04SXyKUNT8l4I9dmgDxypdHgri
         UZSQ==
X-Forwarded-Encrypted: i=1; AJvYcCUbmIY1y0wOy7s8VlLUTLZiAxSUQHdPV7joOnMzgNlgkCuTT7tz6yguJZ3/7tb5vnqyBoARZ7Hmjw==@lists.linux.dev
X-Gm-Message-State: AOJu0YzaZixscspGlhfcHCHupuiktH7v3SmPoKKxDFJAUcS/T9diCzaz
	gaIeVp721qnkBsGjXkaDg7uP6oSDvSvUCeUD0viPPlldiciV1Kn8mAVtNk/g0Ps=
X-Gm-Gg: ASbGncsrLkcA8sTLZGmBEKt3KzbxpOrO7wkwLVaojAB5oQv7o5jXnPMjsh326RPKnqq
	5wj3M6uMWziR2Hi/EDN+9TO9E+PNvmxsHXyGilI3v+Ab2v1vPQdeLapAvejQvVeKwcEPf2N2P/i
	+GCkqFUpHcZZIt94xFoKQal5CDG8VPn8cws8ElSfijWsAH7Fly4sYjbTIlPDcRnAYB0NpTxXXUV
	LMI7EZA1+IYCviDvIcuiOgrgVUN5RHmM2HiVoFYMygB1APji33LCenHTmUCAD8Xd2xKGvpoBg+A
	jJyaBnrAwJ+4sErqsjFYuFpPV8QLTBTBjWjIYe7pVAuBoZbg+2LEU/7uPQB5s+psk7lDJNDvqH5
	9MlIb
X-Google-Smtp-Source: AGHT+IFxdpedis8rLgUjioQVN/bR03F5zkFpjU6epV5YkxNIoc+m7l63P5vylXM+RdtkVFMExNl8uQ==
X-Received: by 2002:a05:6e02:1845:b0:3d9:34c8:54ce with SMTP id e9e14a558f8ab-3da7e2103c5mr13250945ab.18.1746734688787;
        Thu, 08 May 2025 13:04:48 -0700 (PDT)
Received: from [172.22.22.28] (c-73-228-159-35.hsd1.mn.comcast.net. [73.228.159.35])
        by smtp.gmail.com with ESMTPSA id e9e14a558f8ab-3da7e158bfcsm1192895ab.58.2025.05.08.13.04.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 08 May 2025 13:04:48 -0700 (PDT)
Message-ID: <dcc42499-4c6b-450e-8449-414501d6ab62@riscstar.com>
Date: Thu, 8 May 2025 15:04:46 -0500
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 3/6] clk: spacemit: set up reset auxiliary devices
To: Haylen Chu <heylenay@4d2.org>, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, mturquette@baylibre.com, sboyd@kernel.org,
 p.zabel@pengutronix.de, paul.walmsley@sifive.com, palmer@dabbelt.com,
 aou@eecs.berkeley.edu, alex@ghiti.fr, dlan@gentoo.org
Cc: inochiama@outlook.com, guodong@riscstar.com, devicetree@vger.kernel.org,
 linux-clk@vger.kernel.org, spacemit@lists.linux.dev,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20250506210638.2800228-1-elder@riscstar.com>
 <20250506210638.2800228-4-elder@riscstar.com> <aBw3KNwjMeCIfnNR@ketchup>
Content-Language: en-US
From: Alex Elder <elder@riscstar.com>
In-Reply-To: <aBw3KNwjMeCIfnNR@ketchup>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 5/7/25 11:46 PM, Haylen Chu wrote:
> On Tue, May 06, 2025 at 04:06:34PM -0500, Alex Elder wrote:
>> Add a new reset_name field to the spacemit_ccu_data structure.  If it is
>> non-null, the CCU implements a reset controller, and the name will be
>> used as the name for the auxiliary device that implements it.
>>
>> Define a new type to hold an auxiliary device as well as the regmap
>> pointer that will be needed by CCU reset controllers.  Set up code to
>> initialize and add an auxiliary device for any CCU that implements reset
>> functionality.
>>
>> Make it optional for a CCU to implement a clock controller.  This
>> doesn't apply to any of the existing CCUs but will for some new ones
>> that will be added soon.
>>
>> Signed-off-by: Alex Elder <elder@riscstar.com>
>> ---
>>   drivers/clk/spacemit/ccu-k1.c | 85 +++++++++++++++++++++++++++++++----
>>   include/soc/spacemit/ccu_k1.h | 12 +++++
>>   2 files changed, 89 insertions(+), 8 deletions(-)
>>
>> diff --git a/drivers/clk/spacemit/ccu-k1.c b/drivers/clk/spacemit/ccu-k1.c
>> index 9545cfe60b92b..6b1845e899e5f 100644
>> --- a/drivers/clk/spacemit/ccu-k1.c
>> +++ b/drivers/clk/spacemit/ccu-k1.c
> 
> ...
> 
>> +static void spacemit_cadev_release(struct device *dev)
>> +{
>> +	struct auxiliary_device *adev = to_auxiliary_dev(dev);
>> +
>> +	kfree(to_spacemit_ccu_adev(adev));
>> +}
> 
> spacemit_ccu_adev structures are allocated with devm_kzalloc() in
> spacemit_ccu_reset_register(), which means its lifetime is bound to the
> driver and it'll be automatically released after driver removal; won't
> there be a possibility of double-free? I think the release callback
> could be simply dropped.

You are correct.  And unfortunately I didn't include the fix
for this in the patches I just posted, because somehow this
message was not included with the group in my mail program.

I'm going to send v8 after I fix this and verify it again.

					-Alex


> ...
> 
>> +static int spacemit_ccu_reset_register(struct device *dev,
>> +				       struct regmap *regmap,
>> +				       const char *reset_name)
>> +{
>> +	struct spacemit_ccu_adev *cadev;
>> +	struct auxiliary_device *adev;
>> +	static u32 next_id;
>> +	int ret;
>> +
>> +	/* Nothing to do if the CCU does not implement a reset controller */
>> +	if (!reset_name)
>> +		return 0;
>> +
>> +	cadev = devm_kzalloc(dev, sizeof(*cadev), GFP_KERNEL);
> 
> Here spacemit_ccu_adev is allocated.
> 
>> +	if (!cadev)
>> +		return -ENOMEM;
>> +	cadev->regmap = regmap;
>> +
>> +	adev = &cadev->adev;
>> +	adev->name = reset_name;
>> +	adev->dev.parent = dev;
>> +	adev->dev.release = spacemit_cadev_release;
>> +	adev->dev.of_node = dev->of_node;
>> +	adev->id = next_id++;
>> +
>> +	ret = auxiliary_device_init(adev);
>> +	if (ret)
>> +		return ret;
>> +
>> +	ret = auxiliary_device_add(adev);
>> +	if (ret) {
>> +		auxiliary_device_uninit(adev);
>> +		return ret;
>> +	}
>> +
>> +	return devm_add_action_or_reset(dev, spacemit_adev_unregister, adev);
>> +}
>> +
> 
> Best regards,
> Haylen Chu

