Received: from mail-il1-f174.google.com (mail-il1-f174.google.com [209.85.166.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B22F247296
	for <spacemit@lists.linux.dev>; Fri, 25 Jul 2025 12:27:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753446453; cv=none; b=WvLlt7JfgfF1qSrBkAw76IUCZELB755cv12za3G6IotHJEZUb0fToU2g7oF6ceHsCX6t6qvFKpzEM1LdZ1Y8SSYZcFeaArvxO/oG27oFOv91enZqHQ3tg4p9pdpkVVGoK4YQ8QzB6OMmJrnAZmcnRUrNu/i7VIZKk44bjK9ZXVQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753446453; c=relaxed/simple;
	bh=Hcy+1FkKcmyE8pc2/30HA2M4yktRO2YfEreRAJCLW5c=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=dlyHzHSVhEhSUn6DZ72C5ClsNKy4rCKtH106KfRSz2q+Z8hyPPXQYyiudYx3t3w3z5cOafYFrXlIZdM5GYb5yWrgsSAArvMekubWbiSUjeJ5YgWiIax0jNeFJR9QZYzCORGwHJk6G83K0kMeDyVrRdDx9C47AnvDzp9ZaNOdQtI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b=YMmtbbNr; arc=none smtp.client-ip=209.85.166.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b="YMmtbbNr"
Received: by mail-il1-f174.google.com with SMTP id e9e14a558f8ab-3de252f75d7so17252915ab.3
        for <spacemit@lists.linux.dev>; Fri, 25 Jul 2025 05:27:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1753446449; x=1754051249; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=mXLHt76hrkTzdwesrILbdl/mLwV7e1Au7y/ET7GKzzA=;
        b=YMmtbbNrRpt8esKdlDWEDPLO/hAUmKVnsXfwXnumng1zbKtiYV4XWgsc0qc1c0le0a
         ZsvpBXoi645GPBfD679YOtVHEHs92Vw6iVC8VBWK0IuHyHi7cJRZufkTVQ/v1CEoaVjA
         s7SMI0yERcSizkhSgVQbGxIvezeJq5DX+5vTi7r5i8e16RfEkHcJLiwnhn9QqAeHwhT9
         Xr6OQ3AlXwS1vv+Vtxfueh19AHd39jD0Wu093neOfR28i3ow3xf22l5tVjmbXO9T4ZPb
         huqmBTdyZm+j5/vL/SYzKzk0thUmdpJ4gSWD/yGf6O6K+y7fuv2IwK37T6Y2IRv81lxv
         CCfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753446449; x=1754051249;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=mXLHt76hrkTzdwesrILbdl/mLwV7e1Au7y/ET7GKzzA=;
        b=Xe1se7DREqlwvWA0Y9Js+2/Wvpy1nOBT6hsFkPt7JyPYlmGoS+BJtgvRZm30pi6Pen
         pgx7gJ28AoHK9ReGDkBaFskaFJ5vk8+DpDdT7kDPJQoBskLQQBvzYKfnuADoKtj8khuC
         hrjy1E3WaPqAdZFXPcbZuQz11dkj8DlC3ZoESsdGdwYh/8rhDGsoeB3lT6pZKnLdKZ2o
         a4qO07iBX30rGToTTw7QVziOwyxRtQIOBQm9KsU7YJHc0AVhZU0BHb62goQjQ0dnkvU8
         K1lz8hbQ1b1rM/RD+cH6n7vTAWJHZFt7p65rJmkjA57woeEzYAH0ioCHzo7POdqtVErY
         Ssbg==
X-Forwarded-Encrypted: i=1; AJvYcCXsaUeaO5a/edRi9NtAkFY5CUYja/NGOzIQmuBPdjJbercfpaxl/I2l40bjgAIzsveZWvke5mtlKw==@lists.linux.dev
X-Gm-Message-State: AOJu0YwX8xvPPNqKYKcGoWmBkUyvsZU51INVEJfntYVGAFfK+eOJcBRA
	GOGAGsIkK/WRbHMF3TqwZHixzJZoVGuX7mL34grZP20Asjf5tDw9j4QPo6GY+gjyWDY=
X-Gm-Gg: ASbGncsYTIBS5ihIOwqA6GKsrbQag5K63+EVJIZ2GtmVWrmGoHJhXF87hJC59QhzFWA
	HoejjBfhH27b6PCHFyAhzuRRqyukOFg0ULqtrFi6hTX/h5gIPqMrgsaodM6pkOxpq6h7Unvwyer
	io2sToyxMzU9zSb+4JOBgDtrRO8zLivGBB4LK1dPwb9XqH651paaH2KE5ap9+wpzDShZGdABmn6
	UZcyQZrxw0OapZMQWJw5Jg/TzCW8ohAK4oTq4E3C7O0G8PLKul19kUKN6A8bU8178axi7A+duxr
	fCsIfGfl+KmTmmpwJYbnkRSPMASGB1/hb5hayj9GenprkrGDI0vc3oD22kLAsdSlpY0i2YNjPKU
	LWMGpKH2cbd0Gs5nrkTIFpHMUgXM0rmsqrw==
X-Google-Smtp-Source: AGHT+IGhO7mEEzu6qStEKP3YhLwseiPFmOnrBPl6/OYfukEuwKgUEIwMH1W9FrN/Z85sZ2BLST8iBQ==
X-Received: by 2002:a05:6e02:1a4b:b0:3e3:b7e7:7a67 with SMTP id e9e14a558f8ab-3e3c52b01f6mr23978105ab.14.1753446449421;
        Fri, 25 Jul 2025 05:27:29 -0700 (PDT)
Received: from [10.211.55.5] ([199.59.116.160])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-508aebd545fsm992684173.57.2025.07.25.05.27.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 25 Jul 2025 05:27:28 -0700 (PDT)
Message-ID: <e236fa5e-7085-419e-bc68-c49f9416847b@riscstar.com>
Date: Fri, 25 Jul 2025 07:27:27 -0500
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 2/8] mfd: simple-mfd-i2c: specify max_register
From: Alex Elder <elder@riscstar.com>
To: lee@kernel.org, lgirdwood@gmail.com, broonie@kernel.org,
 alexandre.belloni@bootlin.com, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org
Cc: mat.jonczyk@o2.pl, dlan@gentoo.org, paul.walmsley@sifive.com,
 palmer@dabbelt.com, aou@eecs.berkeley.edu, alex@ghiti.fr,
 linux.amoon@gmail.com, troymitchell988@gmail.com, guodong@riscstar.com,
 linux-rtc@vger.kernel.org, devicetree@vger.kernel.org,
 linux-riscv@lists.infradead.org, spacemit@lists.linux.dev,
 linux-kernel@vger.kernel.org
References: <20250724202511.499288-1-elder@riscstar.com>
 <20250724202511.499288-3-elder@riscstar.com>
Content-Language: en-US
In-Reply-To: <20250724202511.499288-3-elder@riscstar.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 7/24/25 3:25 PM, Alex Elder wrote:
> All devices supported by simple MFD use the same 8-bit register 8-bit
> value regmap configuration.  There is an option available for a device
> to specify a custom configuration, but no existing device uses it.
> 
> Rather than requiring a "full" regmap configuration to be provided to
> change only the max_register value, Lee Jones suggested allowing
> max_register to be specified in the simple_mfd_data structure.  The
> 8-bit register 8-bit configuration is still used by default, but
> max_register is also applied if it is non-zero.
> 
> If both regmap_config and max_register are provided, the max_register
> field in the regmap_config structure is ignored.

It occurred to me this morning that the regmap_config structure
can be freed after the call to devm_regmap_init_i2c(), so I'm
going to add a function to free it (if it was dynamically
allocated).

					-Alex

> Signed-off-by: Alex Elder <elder@riscstar.com>
> Suggested-by: Lee Jones <lee@kernel.org>
> ---
> v9: - max_register takes precedence over regmap_config in simple_mfd_data
>      - New function simple_regmap_config() encapsulates providing config
>      - simple_regmap_config() allocates a regmap_config if necessary
>      - A small duplicated comment is removed in "simple-mfd-i2c.h"
> 
>   drivers/mfd/simple-mfd-i2c.c | 38 +++++++++++++++++++++++++++++++-----
>   drivers/mfd/simple-mfd-i2c.h |  5 +----
>   2 files changed, 34 insertions(+), 9 deletions(-)
> 
> diff --git a/drivers/mfd/simple-mfd-i2c.c b/drivers/mfd/simple-mfd-i2c.c
> index 22159913bea03..f3ba79c112d4e 100644
> --- a/drivers/mfd/simple-mfd-i2c.c
> +++ b/drivers/mfd/simple-mfd-i2c.c
> @@ -29,6 +29,36 @@ static const struct regmap_config regmap_config_8r_8v = {
>   	.val_bits = 8,
>   };
>   
> +/*
> + * Determine regmap config to use.  If no regmap_config is provided,
> + * regmap_config_8r_8v is used.  If max_register is specified it is
> + * (also) used, whether or not regmap_config is provided.
> + */
> +static const struct regmap_config *
> +simple_regmap_config(struct device *dev, const struct simple_mfd_data *data)
> +{
> +	struct regmap_config *regmap_config;
> +
> +	if (!data)
> +		return &regmap_config_8r_8v;
> +
> +	if (data->regmap_config && !data->max_register)
> +		return data->regmap_config;
> +
> +	regmap_config = devm_kzalloc(dev, sizeof(*regmap_config), GFP_KERNEL);
> +	if (!regmap_config)
> +		return NULL;
> +
> +	if (data->regmap_config)
> +		*regmap_config = *data->regmap_config;
> +	else
> +		*regmap_config = regmap_config_8r_8v;
> +	if (data->max_register)
> +		regmap_config->max_register = data->max_register;
> +
> +	return regmap_config;
> +}
> +
>   static int simple_mfd_i2c_probe(struct i2c_client *i2c)
>   {
>   	const struct simple_mfd_data *simple_mfd_data;
> @@ -38,11 +68,9 @@ static int simple_mfd_i2c_probe(struct i2c_client *i2c)
>   
>   	simple_mfd_data = device_get_match_data(&i2c->dev);
>   
> -	/* If no regmap_config is specified, use the default 8reg and 8val bits */
> -	if (!simple_mfd_data || !simple_mfd_data->regmap_config)
> -		regmap_config = &regmap_config_8r_8v;
> -	else
> -		regmap_config = simple_mfd_data->regmap_config;
> +	regmap_config = simple_regmap_config(&i2c->dev, simple_mfd_data);
> +	if (!regmap_config)
> +		return -ENOMEM;
>   
>   	regmap = devm_regmap_init_i2c(i2c, regmap_config);
>   	if (IS_ERR(regmap))
> diff --git a/drivers/mfd/simple-mfd-i2c.h b/drivers/mfd/simple-mfd-i2c.h
> index 7cb2bdd347d97..6fa36b3d7a217 100644
> --- a/drivers/mfd/simple-mfd-i2c.h
> +++ b/drivers/mfd/simple-mfd-i2c.h
> @@ -8,10 +8,6 @@
>    * shared by all sub-devices.  Children can use their parent's device structure
>    * (dev.parent) in order to reference it.
>    *
> - * This driver creates a single register map with the intention for it to be
> - * shared by all sub-devices.  Children can use their parent's device structure
> - * (dev.parent) in order to reference it.
> - *
>    * Once the register map has been successfully initialised, any sub-devices
>    * represented by child nodes in Device Tree or via the MFD cells in the
>    * associated C file will be subsequently registered.
> @@ -25,6 +21,7 @@
>   
>   struct simple_mfd_data {
>   	const struct regmap_config *regmap_config;
> +	unsigned int max_register;
>   	const struct mfd_cell *mfd_cell;
>   	size_t mfd_cell_size;
>   };

