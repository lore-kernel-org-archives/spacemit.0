Received: from mail-il1-f182.google.com (mail-il1-f182.google.com [209.85.166.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82C20237709
	for <spacemit@lists.linux.dev>; Mon, 17 Mar 2025 12:11:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742213477; cv=none; b=KuDLHxjkGr44zsHyEmIvp8gFvC64B2agSq+nO9e+AGi1N33ilRHNq1oLiLG2yOpbHiNSNuP5OjzOXSbfhhJ/mes2s4MO366kXiKuLV6sdDpXl4KaeyJMZvSrtmgHda9kX2timEu/KnTHe+d17d06w/SIEM34b4XxFHQxYaxCnMs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742213477; c=relaxed/simple;
	bh=rkx57oeapfLrwsTzh7bfXfL9+ooCnSJcupMTLnD1GBM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Ew8sg+jf1TE8J5B4btrhBR2eKZyidA3pmFfSdjmP/n5CdRoun3PyB5TEcLCtPo3UrOoFhePzYFbtpTR+sEsmQjTD9S+8fZJu5O8pwfLLi5/RdGxuOd5nROBha8GDN/Hco3J/QkI2sxzpisoRWGHmzakIwvqeDJxMMrlL+CD1YTA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b=fG6HugyZ; arc=none smtp.client-ip=209.85.166.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b="fG6HugyZ"
Received: by mail-il1-f182.google.com with SMTP id e9e14a558f8ab-3d445a722b9so24098285ab.3
        for <spacemit@lists.linux.dev>; Mon, 17 Mar 2025 05:11:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1742213473; x=1742818273; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=C0AefTr+b/KmSIHJ/y0w6HkDTitHcQhMEPmgA2zTVn0=;
        b=fG6HugyZE4UtcXpDiD8DJREPP+q26tsVXUtBAf7hXndkGSUlzumFfiycjTvCmZs0qn
         6EY5bjKBpsS1uYB8P5dVGhPo7x7tDHASK7LoVpgFNv5DD5/3PHYopU3eVqsag9v4ghGp
         GaWiXmRmd9CTn887Sqt/JEWE7ellLWaw0FiBzdjfMx8j6RQ4o60DGMPP+Ds/eG2xwYeg
         krG1u3vc0CRYdIUN4twNHK0qQMKjtllawN+FzaJfFM+6wVVb+q4CR9W8FRpDL2syzsNp
         aJQeWDd/yR7iZhDOceF4/jqIXl/oWl0iHXD4ugE/2GuGaqNhaH3pDEOduXMvW/b7tjuE
         ENTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742213473; x=1742818273;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=C0AefTr+b/KmSIHJ/y0w6HkDTitHcQhMEPmgA2zTVn0=;
        b=wn7O0CXzexgiOoPwkm9pp8ltZiHk/Y+iKAanL+UGxZXCN9n5Z367butTcW+rgRBzWR
         hwvEqdCyDCAlsc6MiTmWRRdfIjpn/H/cD05NnWsaYDAJC9PjDQTRdqe9dUnGx0bDUI8c
         VmadB5H8viy2dJUyCR8B7x6VSTEi1APrqbiwDGxtdQkMt/xi5WlWUB8U2yrCtVYlKXaC
         RWl37oKsG4QPckAO4i0WcAmXE4jAxCkLQvkBO60J7DxFJhnVT5Jht+nU6UMUODCOMyIa
         Dr7XNJEAkIPltKiiLPM+zLlABp98+ujHHKerbrqbXNq0HiPd4MdX7HDP38xV73v723zY
         MPMw==
X-Forwarded-Encrypted: i=1; AJvYcCWz1D/BOhMxUxEOhaQw+om2NXoEMG+IowuCKk4WdEuh7IM/V3tYL3QlgmexJLaDB7wYCEV0TSa/dw==@lists.linux.dev
X-Gm-Message-State: AOJu0YyBhJg2RglNscXv3QfL4sYEVBMDU2K5Bsa3kaBF1HEPYd8GwbZD
	poU1xTaCYrBh4CGg3uLlWoL1ovSkicLnNJVrO9UBBtJqgXMySfkC6dNSJOOu6PM=
X-Gm-Gg: ASbGncvgkppiWX7fIitniUbTd5mNXPGFfW2rynjqMXPi7rGDAZZvFggfmE1fxNt8k1o
	i4bqtaBpDtlIZWZHNUY8fAZMxFShNld54fwhxcD4zRO4E5a1IvfDWNLrjpiZGYCl4u0GtlhttBx
	QcrTOD/w60R/y9AkrRIqsi2ZXa2Odwx+6lgBivIwoemKXFbIp+SfvVBOadsb865yPm86PbiG7Xk
	gKHXxgDaaRZ6nhCvdCCWYjAxz+BDOfGehTBtKFasajhzwGOxyHj4gzTxdTBNyApv/CIkbErx9N9
	PTk4kBYRAki6HrEFo57ica1o/JE6Z6xc0/D1ujNdCm0ywBRYBF5tXDl+KGeoLiFDgezeZ6VXa5B
	lzv8hKR/8
X-Google-Smtp-Source: AGHT+IHihbZvdnYYDfqQYS9Hgz8z5Z3z4PweP7imJlwjMD1yaS93kmhWHJcx0wBiJ8Y5JrB0JR4bZA==
X-Received: by 2002:a05:6e02:3041:b0:3d4:6dd2:3989 with SMTP id e9e14a558f8ab-3d483a88a3emr151134105ab.20.1742213473560;
        Mon, 17 Mar 2025 05:11:13 -0700 (PDT)
Received: from [172.22.22.28] (c-73-228-159-35.hsd1.mn.comcast.net. [73.228.159.35])
        by smtp.gmail.com with ESMTPSA id e9e14a558f8ab-3d47a666583sm26051995ab.16.2025.03.17.05.11.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 17 Mar 2025 05:11:13 -0700 (PDT)
Message-ID: <26f931a0-602b-45a9-a533-b297033655ae@riscstar.com>
Date: Mon, 17 Mar 2025 07:11:11 -0500
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] pinctrl: spacemit: enable config option
To: Geert Uytterhoeven <geert@linux-m68k.org>, Yixun Lan <dlan@gentoo.org>
Cc: Linus Walleij <linus.walleij@linaro.org>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Alex Elder <elder@kernel.org>,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-gpio@vger.kernel.org, spacemit@lists.linux.dev,
 Conor Dooley <conor.dooley@microchip.com>
References: <20250218-k1-pinctrl-option-v3-1-36e031e0da1b@gentoo.org>
 <CAMuHMdV4xWLEuCvCC54GBfCdELE=QSHqaOyUPD-ezE0QLYRnVA@mail.gmail.com>
Content-Language: en-US
From: Alex Elder <elder@riscstar.com>
In-Reply-To: <CAMuHMdV4xWLEuCvCC54GBfCdELE=QSHqaOyUPD-ezE0QLYRnVA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 3/17/25 3:18 AM, Geert Uytterhoeven wrote:
> Hi Yixun,
> 
> Thanks for your patch, which is now commit 7ff4faba63571c51
> ("pinctrl: spacemit: enable config option") in v6.14-rc7.
> 
> On Tue, 18 Feb 2025 at 01:32, Yixun Lan <dlan@gentoo.org> wrote:
>> Pinctrl is an essential driver for SpacemiT's SoC,
>> The uart driver requires it, same as sd card driver,
>> so let's enable it by default for this SoC.
>>
>> The CONFIG_PINCTRL_SPACEMIT_K1 isn't enabled when using
>> 'make defconfig' to select kernel configuration options.
>> This result in a broken uart driver where fail at probe()
>> stage due to no pins found.
> 
> Perhaps this is an issue with the uart driver?
> I just disabled CONFIG_PINCTRL_RZA2 on RZA2MEVB (which is one of the
> few Renesas platforms where the pin control driver is not enabled by
> default, for saving memory), and the system booted fine into a Debian
> nfsroot.  Probe order of some devices did change, and "Trying to
> probe devices needed for running init" was printed.
> 
>> Fixes: a83c29e1d145 ("pinctrl: spacemit: add support for SpacemiT K1 SoC")
>> Reported-by: Alex Elder <elder@kernel.org>
>> Acked-by: Conor Dooley <conor.dooley@microchip.com>
>> Tested-by: Alex Elder <elder@riscstar.com>
>> Signed-off-by: Yixun Lan <dlan@gentoo.org>
> 
>> --- a/drivers/pinctrl/spacemit/Kconfig
>> +++ b/drivers/pinctrl/spacemit/Kconfig
>> @@ -4,9 +4,10 @@
>>   #
>>
>>   config PINCTRL_SPACEMIT_K1
>> -       tristate "SpacemiT K1 SoC Pinctrl driver"
>> +       bool "SpacemiT K1 SoC Pinctrl driver"
>>          depends on ARCH_SPACEMIT || COMPILE_TEST
>>          depends on OF
>> +       default y
> 
> Ouch, fix sent...
> "[PATCH] pinctrl: spacemit: PINCTRL_SPACEMIT_K1 should not default to
> y unconditionally"
> https://lore.kernel.org/6881b8d1ad74ac780af8a974e604b5ef3f5d4aad.1742198691.git.geert+renesas@glider.be

This is interesting; what you say was what was proposed in v1
of the patch series.

I did not understand COMPILE_TEST to be used the way you say,
but I think that just means you understood it better than I do.

I think the rule is that "depends on FOO || COMPILE_TEST" alone
is fine.  But if you are going to specify a default, it should
be "default FOO" and not "default y".

Thanks for pointing this out.  I'll go respond to your patch.

					-Alex

>>          select GENERIC_PINCTRL_GROUPS
>>          select GENERIC_PINMUX_FUNCTIONS
>>          select GENERIC_PINCONF
> 
> Gr{oetje,eeting}s,
> 
>                          Geert
> 

