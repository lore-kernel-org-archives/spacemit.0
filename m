Received: from mail-il1-f177.google.com (mail-il1-f177.google.com [209.85.166.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3674C22AE45
	for <spacemit@lists.linux.dev>; Mon, 12 May 2025 16:27:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747067249; cv=none; b=mTa/QcKHu7lVHQdoCpdsq5bZw7K0l+DNWRbk3aIBxQCFEu3d8vcAA9WaWeks4pWx+KIlKf4DCudfswEi7GTxXoUr1CctRdwQbQRyZJDYvYebPJKamkb4Uc62QbkJgO5JagKM8FMJPwuBwPSaTrGEvSBFfgdriM/1MpUv+di1hd0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747067249; c=relaxed/simple;
	bh=J2u66nb+ZRnekPNZzRKWIEEdjXCW8XvffK8/9kLcR0Q=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=d6ALQRK34K2ru+SceoFoQktK7e/0J7+qHH/Hw9YDfZSduKDQ3gBsGbQBrfoiZA0NGhV0qq85J56t8AYZ2lMCfmp8jemtYOYfmrRDAriBHnpDpD+y01tfTiV7ovJ8/F2S0tRd2+WiwqbkYf0q9FftdgbX6aExtBK/qEOF/yKKSzE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b=XjbBjMLR; arc=none smtp.client-ip=209.85.166.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b="XjbBjMLR"
Received: by mail-il1-f177.google.com with SMTP id e9e14a558f8ab-3cfce97a3d9so32997095ab.2
        for <spacemit@lists.linux.dev>; Mon, 12 May 2025 09:27:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1747067247; x=1747672047; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=tAY5Ws/2zHP7f1+msXoBsYcHSMzdc5Is7v349rd+4sk=;
        b=XjbBjMLRd1xsHtE+CHT9aBZDGSmv8s9xCgnMnXCeaWiEN5F1I3/zo0ps5p255WId/Y
         v4VaiJHNy9ejiy8SgML5dP+Sld8CECQhxlXsIeSuHz7gApKAiseOLKX3xUwD8nRr/Mg3
         wTGYY2BHRqFHHNCrNGJgvBhUGe4cCUwBRoRwNfsCVbkvE4tHXX9ZtAqTJd8HgqrbBlJc
         dYKrT3Bc/GRKnLl+mfmjcQFATvSmhOArd/muAnTcm/d682cyr5mIc8zG/fYAPOo7RVbw
         w+bASMsZ15kn05CJQJgJoMm9IrjAZpTR+tPQhMgfGghn94nYMmgFojpWEEiIHwFPNlmw
         d08A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747067247; x=1747672047;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=tAY5Ws/2zHP7f1+msXoBsYcHSMzdc5Is7v349rd+4sk=;
        b=sO2chBhd54UVftYQmVj8y9XEPJFeLzLNJqQ41o3+CXJAcA6bR99kS9BnpxkgWqNrrn
         8hYUgyL9Sxn0l2ggvxdKOx52jnYc/NUMF3K0j4cSSbFQ7TyvokCd6bg7td9rSEI081XV
         hrQg2j24h1TePw9SgJqtIgiSU+2GFWz814tg1c1BwPSPKhNmMhq881Vr9qycLFe5v2sJ
         kpFjPVbTFWh/DRKttkL71mSo2N3meo6K8L6hQa97ZwJ291eP3ZC/lL7/O4IAkGNCEP4l
         BvkZf/yhKodNi1v0cQmXd7nUSbpcCHu42Sg7SxQmz5gL19ysJfRO+75tXBj+/oORkZQl
         37aA==
X-Forwarded-Encrypted: i=1; AJvYcCUuL2MsuUq61DxT84iprBK1SZ4xi5Akzpv1nGWWPhA6j0MK6687ntceZikNhMDZDJYALImRlO0/Gw==@lists.linux.dev
X-Gm-Message-State: AOJu0YxW7QWdl/B5x4DGOiZStYNO8KlrD5jI/Etl7O/hMVvuiMiRuo+D
	IP2KiITq7JX8lmqWgOByF1+h4REy6ctcN62P2A6j8HUVbQm9xm3Im7EEmJIH/E8=
X-Gm-Gg: ASbGncs6FKp8etPDjj3kY7wmXCh3kIGZwdBmoCF/d/5rHOg0RBWCAp6LSJF3hGiPHLv
	iJAcXCjXYv1EDEGHsDxyRSHLptseTYdvX/l2yCZDRHiiEs8soMfR+cLrBOEDF94zbFrviOIiJrq
	tLRCvteMgcB2yRXmToD9Y22XJ44XB6DiPccf1dpa9gPNVajomjTGWp5oARxLpLsi91dZ4e+ALSf
	0VLz0KeXX0LpLe08aq8D/Rqs1Wt+pESnOoALrXV/4JJn5w0VyZJ2tdadgur45BcHYRAWBFcBZpV
	0qxC8mbZ5nwZPAF1Y06N6ZB3rlOfolUjcjSp2G1F0f3/Ux0rVxVGJsETOgmJyLPN5MKIWQy0NTl
	vdQRh9ltd1ELVTK2nSWDRsOdqbw==
X-Google-Smtp-Source: AGHT+IHMljbBOih9XI5ChNfY5x9ORAxK3ZQZvd0UNipzv1F6zPCMndWOAl1ZZJYumsZfCVB/PanfHw==
X-Received: by 2002:a92:cda7:0:b0:3d9:66c7:d1e8 with SMTP id e9e14a558f8ab-3da7e165314mr150329395ab.0.1747067247243;
        Mon, 12 May 2025 09:27:27 -0700 (PDT)
Received: from [172.22.22.28] (c-73-228-159-35.hsd1.mn.comcast.net. [73.228.159.35])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-4fa2a9ac275sm1503877173.80.2025.05.12.09.27.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 12 May 2025 09:27:26 -0700 (PDT)
Message-ID: <5674cfb0-fabe-4b58-98fd-8479c4d3ff79@riscstar.com>
Date: Mon, 12 May 2025 11:27:25 -0500
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 3/6] clk: spacemit: set up reset auxiliary devices
To: Philipp Zabel <p.zabel@pengutronix.de>, Yixun Lan <dlan@gentoo.org>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 mturquette@baylibre.com, sboyd@kernel.org, paul.walmsley@sifive.com,
 palmer@dabbelt.com, aou@eecs.berkeley.edu, alex@ghiti.fr, heylenay@4d2.org,
 inochiama@outlook.com, guodong@riscstar.com, devicetree@vger.kernel.org,
 linux-clk@vger.kernel.org, spacemit@lists.linux.dev,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20250509112032.2980811-1-elder@riscstar.com>
 <20250509112032.2980811-4-elder@riscstar.com>
 <20250512135429-GYA517867@gentoo>
 <abfd4c78-2592-4b8a-97be-109a8fd1bed6@riscstar.com>
 <91afcfde275a28127ba0df962a9abf4d07ba6b8b.camel@pengutronix.de>
Content-Language: en-US
From: Alex Elder <elder@riscstar.com>
In-Reply-To: <91afcfde275a28127ba0df962a9abf4d07ba6b8b.camel@pengutronix.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 5/12/25 10:46 AM, Philipp Zabel wrote:
>>> so I'd assume the underlying device doesn't really care the id?
>>> but with different order of registration, it will result random id for the device
>> These things are identified in DTS files by their index values
>> defined in "spacemit,k1-syscon.h".  If there is a need for the
>> assigned device ID to be consistent, I'm not aware of it.  Can
>> you think of one?  I think all that matters is that they're
>> unique, and this ensures that (for up to 2^32 PMICs).
> If there are multiple reset controllers and the driver can be unbound,
> it's trivial to provoke a collision by keeping one device bound and
> unbinding/binding the second one until next_id wraps.
> This could be fixed by using ida_alloc/free to manage the id.
> 
> regards
> Philipp

OK thank you.  I'll put together v9 of this series and will use
an IDA to set the device ID.  Thanks again for the explanation.

					-Alex
