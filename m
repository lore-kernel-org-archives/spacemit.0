Received: from mail-oo1-f49.google.com (mail-oo1-f49.google.com [209.85.161.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E545353ED2
	for <spacemit@lists.linux.dev>; Wed, 28 Jan 2026 13:29:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769606943; cv=none; b=pBtpRiUktM/fvLsTpS1V/U3DYFyA7ObW/H6CEHmxMuXgd8Tq+D8dFnWb7Pdz/Lqgo/v6CZPDWju7TLgSXDutLENvqgJqkjygGXF4DZJfKNGi362x4pNRLUkl92/mg3JtGEePoZ5QZ2MKmwhgJdk0N6uPMEnOgKEbxjbC+9U4I7A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769606943; c=relaxed/simple;
	bh=/SRbLJIOBCp6SkKGBSg0cd0VrfNVnSQQ5K/0eCQIYng=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=UpxTgmdR14OBnZKXHqxuQMtNjXLjE4QvYv2LdgHrXplIMgIrhmj9dIZHNMGnicr3S6CwF6PG1I0rTi0NhzCip8gE4nnk5pyVzdTJdZyOE7b3Jqgwni8Bpp2h9Z3r004SeslVPJF0alnD5w9wEcfbmYTaYqp/zq99vZVTth/3SG4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b=WphW96iu; arc=none smtp.client-ip=209.85.161.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b="WphW96iu"
Received: by mail-oo1-f49.google.com with SMTP id 006d021491bc7-6611cab8ca3so2342876eaf.3
        for <spacemit@lists.linux.dev>; Wed, 28 Jan 2026 05:29:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1769606940; x=1770211740; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=O3+eV0m5YOcp1OGVa9q7WwRpTmAwgwaorWnGyCzBuiI=;
        b=WphW96iuKh9ff9B3/jb6Rx+70ki2h9iLBA9XVtHd1GKpSGKhZx23XNu6lKrQ+L6nTz
         efvnfDMqZFywDluVudA6ThSyMAONDPKDK+8lnNsqrra0UfUAEgwtrtzfs+MKRW9xGNma
         beu/tLHOhnfUNENt4pkI9/eAWPGXxQ83IVy3FyMlbvgDsm0t4tj7m90i9s1DELTZg3aZ
         tsnETqtJeUBeN8hYlF5eXZb2U3a9E3K6lyyQiXnDEm1Eacn7xUMh8wWFvX3VNVGfxhqY
         3fyJK88KbSgQmIQ5cJMRUu11TLKVqMcL20PhtowdZpgfw1kDNpA87JygPGJ+o599KO5k
         fyjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769606940; x=1770211740;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=O3+eV0m5YOcp1OGVa9q7WwRpTmAwgwaorWnGyCzBuiI=;
        b=JmoJ12LwGUw8bOAh9uo5+KWbj3vurkSQpUEuLr+KVATKfkv2GHmH2bNfYFPQ/q7iPm
         lggqruVWrIXmEaeDl7ujGC6z5LaK4lwgk9hdBkpG+RSU8RY2C8hiaWDw4hNMrwyNxD00
         9kPHzJTKQs4o39+g/aBYgoMMcMckv3dwBIlsEN8lYChbEZSS7DnLfl7KIdLSXtO53lWp
         3B7f4n0HPmPIZexQhwNXKbaXTtPCV00axGIurdHIl9o3YuW/Yqe175mTtAzVn7pMPwBm
         2Lc0ucvhy9RxMfL2efIM/bdrtIA5CxwlsZbL4KTezaYYxz17/bH42sp8T4Mrj7vXQyWu
         KIAg==
X-Forwarded-Encrypted: i=1; AJvYcCVJ40hIDbVBKnHw+bMjlJU+9me3QBeVp0HY7Tr5mEfGZgbSCbwr1tAoarLQcMxa9xe/bLSumWdmcQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YzOBDcSyeHWuKcwPT40hEAcgEzM867jBE3xUftPSjhb5/WFoSXO
	CebQGhEHpQ4eOEQat79OS8vKY3fX5Aif6jmSjTlj1UOLVH8oEY9+4sX7HnXW0WhpjzQ=
X-Gm-Gg: AZuq6aIFSkb4x9DeCdswsdeJNHi+zfPbfhiw21FKtHGEQaXvFGcDoOW5bgrntHEwWjz
	JEwKp4Fpu0PfLOTLxNAKI5b0KxbJelEMZdEJnz5LqLjqZEWvF/AHlnkOkKxBbWzezU5MDyIyLz8
	O8AWWrbbk75pOdo3qnIpLPFUCDb6R0J/HIXdYIUYNt/CYS32JMV1LkfI+070sv74kTjAgGN9xIZ
	U5c/GgAi2S1bQS8RoAVGBqWZWpnMOf9YoUk8WoW+CyQjNJZ96efwwyqY/wqOTbElpi0jArctSUw
	GinJIL88wXlqd4bn4iyFoobHT9aNAbRx3TYDiiTR5e3Iv0brv4zHOOpw0j5FX+grAyPkhJOu1sQ
	R2xy9TgPvh+zgLYNRDniFJNQ1TeoLDVmNCTj3EQBoWIRi/fLrnfOzQlaUUsjfLONWjr/Qoim6qM
	62Ceu8F9NsH9ivSzxZut+85oqbvtM9LTA+rO3on3OSWnmO5oKqggA=
X-Received: by 2002:a4a:ee06:0:b0:659:9a49:8efc with SMTP id 006d021491bc7-662f208c524mr3076054eaf.13.1769606940245;
        Wed, 28 Jan 2026 05:29:00 -0800 (PST)
Received: from [172.22.22.28] (c-75-72-117-212.hsd1.mn.comcast.net. [75.72.117.212])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-662f994388fsm1374132eaf.4.2026.01.28.05.28.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 28 Jan 2026 05:28:59 -0800 (PST)
Message-ID: <4395bea9-44d7-4f0f-81d6-c1e05976a308@riscstar.com>
Date: Wed, 28 Jan 2026 07:28:58 -0600
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/4] regulator: spacemit-p1: Update supply names
To: Guodong Xu <guodong@riscstar.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, Yixun Lan <dlan@gentoo.org>,
 Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Troy Mitchell <troy.mitchell@linux.spacemit.com>,
 Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>
Cc: linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
 spacemit@lists.linux.dev, devicetree@vger.kernel.org
References: <20260124-spacemit-p1-v2-0-2c86b06694ba@riscstar.com>
 <20260124-spacemit-p1-v2-3-2c86b06694ba@riscstar.com>
Content-Language: en-US
From: Alex Elder <elder@riscstar.com>
In-Reply-To: <20260124-spacemit-p1-v2-3-2c86b06694ba@riscstar.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 1/23/26 6:20 PM, Guodong Xu wrote:
> Update supply names to match the P1 PMIC's actual hardware pinout where
> each buck has an individual VIN pin (vin1-vin6) and LDO groups have
> dedicated input pins (aldoin, dldoin1, dldoin2).
> 
> The supply is a board design decision and should not be hardcoded to any
> existing power source. This allows boards to specify their actual power
> tree topology in devicetree.
> 
> Signed-off-by: Guodong Xu <guodong@riscstar.com>

These are good changes but I have a suggestion on the way
you define the DLDO descriptors.  I might be mistaken but
I think you should make this change.

Aside from that:

Reviewed-by: Alex Elder <elder@riscstar.com>

> ---
> v2: No change.
> ---
>   drivers/regulator/spacemit-p1.c | 25 ++++++++++++++-----------
>   1 file changed, 14 insertions(+), 11 deletions(-)
> 
> diff --git a/drivers/regulator/spacemit-p1.c b/drivers/regulator/spacemit-p1.c
> index 2b585ba01a93..57e6e00a73fa 100644
> --- a/drivers/regulator/spacemit-p1.c
> +++ b/drivers/regulator/spacemit-p1.c
> @@ -87,13 +87,16 @@ static const struct linear_range p1_ldo_ranges[] = {
>   	}
>   
>   #define P1_BUCK_DESC(_n) \
> -	P1_REG_DESC(BUCK, buck, _n, "vin", 0x47, BUCK_MASK, 255, p1_buck_ranges)
> +	P1_REG_DESC(BUCK, buck, _n, "vin" #_n, 0x47, BUCK_MASK, 255, p1_buck_ranges)

That was a simple change...

>   #define P1_ALDO_DESC(_n) \
> -	P1_REG_DESC(ALDO, aldo, _n, "vin", 0x5b, LDO_MASK, 128, p1_ldo_ranges)
> +	P1_REG_DESC(ALDO, aldo, _n, "aldoin", 0x5b, LDO_MASK, 128, p1_ldo_ranges)

As stated before, I believe the 128 should be 117 here.  (If
you change the earlier patch, make sure the change to 128
doesn't persist here.)  Same comment for the DLDO regulators.

> -#define P1_DLDO_DESC(_n) \
> -	P1_REG_DESC(DLDO, dldo, _n, "buck5", 0x67, LDO_MASK, 128, p1_ldo_ranges)
> +#define P1_DLDO1_DESC(_n) \
> +	P1_REG_DESC(DLDO, dldo, _n, "dldoin1", 0x67, LDO_MASK, 128, p1_ldo_ranges)

Why can't you use _n here like you did for P1_BUCK_DESC() above?

> +
> +#define P1_DLDO2_DESC(_n) \
> +	P1_REG_DESC(DLDO, dldo, _n, "dldoin2", 0x67, LDO_MASK, 128, p1_ldo_ranges)

So this is generalizing the input, which is good.  The use
of "buck5" here was a Banana Pi BPI-F3 design and but it
doesn't have to be that way.

>   static const struct regulator_desc p1_regulator_desc[] = {
>   	P1_BUCK_DESC(1),
> @@ -108,13 +111,13 @@ static const struct regulator_desc p1_regulator_desc[] = {
>   	P1_ALDO_DESC(3),
>   	P1_ALDO_DESC(4),
>   
> -	P1_DLDO_DESC(1),
> -	P1_DLDO_DESC(2),
> -	P1_DLDO_DESC(3),
> -	P1_DLDO_DESC(4),
> -	P1_DLDO_DESC(5),
> -	P1_DLDO_DESC(6),
> -	P1_DLDO_DESC(7),
> +	P1_DLDO1_DESC(1),
> +	P1_DLDO1_DESC(2),
> +	P1_DLDO1_DESC(3),
> +	P1_DLDO1_DESC(4),
> +	P1_DLDO2_DESC(5),
> +	P1_DLDO2_DESC(6),
> +	P1_DLDO2_DESC(7),
>   };
>   
>   static int p1_regulator_probe(struct platform_device *pdev)
> 

