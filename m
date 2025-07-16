Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E5B22EF66D
	for <spacemit@lists.linux.dev>; Wed, 16 Jul 2025 09:37:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752658655; cv=none; b=eYFNWMrvgS5O/+pjpioSb8dthEwiF4HxefjV6nX0UcKV2NiZOIgtAbx1i9XFf56/vr8bwwmF4+vUjwmesC9Kmg0JREWMbgF99Ox87Z/FwWuYcVNhD2pIUlGKMnSgg4ylNCi0oFMUr47wK6v1jsE43Hl4eSz/mIM0yaCALM60cPg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752658655; c=relaxed/simple;
	bh=Rv1WGu71RvsH+PoMrbT5bMaAhPBIVdTsoAe+rkNha0A=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=CLWccNk1mkhbuv2MK1kbjy2HmJw6cIUlwtKLlVjpsTzFBvLdrdpNuH1nUNMaCo650tjTQq2OeQLw7Fg0z5ki+i2WYvQHWWW15qxDc4wgfVoUBiFAwLGyi22nef9uSyod+mpuoSVPyMrBhuEwWCYSl7NDCN+tP6vd0LSoa2fFMyo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=hammernet.be; spf=fail smtp.mailfrom=hammernet.be; dkim=pass (2048-bit key) header.d=hammernet-be.20230601.gappssmtp.com header.i=@hammernet-be.20230601.gappssmtp.com header.b=h7iJdNbh; arc=none smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=hammernet.be
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=hammernet.be
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=hammernet-be.20230601.gappssmtp.com header.i=@hammernet-be.20230601.gappssmtp.com header.b="h7iJdNbh"
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-3a528243636so3593617f8f.3
        for <spacemit@lists.linux.dev>; Wed, 16 Jul 2025 02:37:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=hammernet-be.20230601.gappssmtp.com; s=20230601; t=1752658651; x=1753263451; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=mRIwbcS0H9zdmv+BDkzGsQ7wEXHGjYbRxt2gj93AB+0=;
        b=h7iJdNbhBMEC7hM8GDNKJCt/0PTE2zzPWdmb264ZVZ/N3LKcz5dUJ6xOJgF/R7yuS/
         h6QpKRssQHhnh5lT3LHYRJpmgTKMrH7BdIUJMtJwaOtVSBXgJgXlIusG4CE6rl3Mf94u
         KSCsRiKsDPiS1n/UPxYCTPr2NgzmUa7H+uuXrAzYQlj7OaqlrDlfLIuOaQfvOE0+Xtup
         EFjUHso3m9gEf4WtxPgn0/hg14T1dM4PoCykYJ7/woS2v0gLLQGYHZnzRzTFwcWZA14W
         G7QQBs8dhf5vcn0GlR8fiHQT4lzBG7jjQos49FItjMMS+C6JvYs+xJ7R0s4S+woLmSkr
         XNmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752658651; x=1753263451;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=mRIwbcS0H9zdmv+BDkzGsQ7wEXHGjYbRxt2gj93AB+0=;
        b=dj9tJ/O2yTcW0xqloCjj8Xi/MmQXcZQMDcOFJSYifCyxdPYacgnyGE+LnFy5gtOxUl
         LE1DqjGDn4XEMNLq4SzqOhrlM67au5x3SLj9j4ZUiUMlchUgqSerISspwEP9xcJZh6dq
         3Igb3OuJTa+8EjXKxhfNBll7xdMIp/LCCMJvpjnKCdA/erz577hUxIwKBHa/93CARYdt
         bb7Wlzh4iO/0wagYRU2tmDYNKl2Lq19+PPZv7ApGjbSBdgipbXeLzMpwbEsZzypKRiay
         1WG0b40Y4ZHfAlwPN0xFk9koMzhBxelorXXNXGhu5R5khr42VMDPyjiEatfXU8JJHPFi
         qg1Q==
X-Forwarded-Encrypted: i=1; AJvYcCUatuBLK/0JFpIUR7S62Jq+prvbecTaV3t7AiCp9imZcX9VZ4OiHT7DWNYwkEG3YUg8aFbqmaS68w==@lists.linux.dev
X-Gm-Message-State: AOJu0YxwEI2D9pxQwGX1Q+3mWGkbRN8+uk4doAnJYg9deIYH80+BmxCH
	q8uzJ2xoU83PRdWJPKX8rQadPaklqWmhxQ581shUAgetN1612THVhMdAEnDeX60tW14=
X-Gm-Gg: ASbGnctpypBJ7oPbVtpkFPRoTf24S+OFY6ZTtLT1dVjGkc3TtHhjr+CAaHY3CYiwrqE
	v8hymPeKGwdJywSAhdm9thK/eGr1mdvc9ZqiynU/E3F3S1Xfd1Kw10sdChxne5uc2wYzgd0XpNC
	dDSWk3WmKkfrWu8j+2I+FiTGjCdCc7IIAwRq0Y6YREMfUZItcSYZiLl7wsyJNc3lYr3ICcQoZE2
	QRSvEee9LOjgOJmC7V4SHDm7+yA0gALKyEm9sB4sDWLhdtb4T4eoponkmxhcEBdlRIzNlPQVbIz
	dmsyRL2PPN+9byvRRlBER22f7Fs4efZx0oW1hER02AYTRp2K7EmjmTkKE9xrgLZZjIOy4lyvvjO
	i5YF74EUl4G/q/zm/Ke5mJ65kgxUqXr15Bsz99ozGIrEMI6BZVgztyoQzF5v4TpCK5qGJl0IW/1
	DbGFcYKlnPGog2kJ4Lw5dF
X-Google-Smtp-Source: AGHT+IE4uVb9YKbrx3ndRNHKiFm08G4TVQtoQIPhB1Z5lx2K3LriBMWvhlHyxvUwMMKUbX/m2DA1HA==
X-Received: by 2002:a05:6000:43cc:20b0:3a5:39be:c926 with SMTP id ffacd0b85a97d-3b60dd7aab1mr1328671f8f.32.1752658651434;
        Wed, 16 Jul 2025 02:37:31 -0700 (PDT)
Received: from ?IPV6:2a02:1807:2a00:3400:5da9:c53:46d0:bd62? ([2a02:1807:2a00:3400:5da9:c53:46d0:bd62])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4562e7f2f28sm15619335e9.2.2025.07.16.02.37.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 16 Jul 2025 02:37:30 -0700 (PDT)
Message-ID: <95125019-8eaa-4242-8e68-78771ce85947@hammernet.be>
Date: Wed, 16 Jul 2025 11:37:29 +0200
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] riscv: dts: spacemit: Add OrangePi RV2 board device
 tree
To: Yixun Lan <dlan@gentoo.org>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 paul.walmsley@sifive.com, aou@eecs.berkeley.edu, alex@ghiti.fr,
 palmer@dabbelt.com, skhan@linuxfoundation.org,
 linux-kernel-mentees@lists.linux.dev, devicetree@vger.kernel.org,
 linux-riscv@lists.infradead.org, spacemit@lists.linux.dev,
 linux-kernel@vger.kernel.org
References: <20250711183245.256683-1-hendrik.hamerlinck@hammernet.be>
 <20250711183245.256683-3-hendrik.hamerlinck@hammernet.be>
 <20250715102534-GYA542593@gentoo>
Content-Language: en-US
From: Hendrik Hammernet <hendrik.hamerlinck@hammernet.be>
In-Reply-To: <20250715102534-GYA542593@gentoo>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hello,

Thank you for the review.

On 7/15/25 12:25, Yixun Lan wrote:
> On 20:32 Fri 11 Jul     , Hendrik Hamerlinck wrote:
>
>> +/* Copyright (c) 2023 Ky, Inc */
> Copyright should cover current year, which is 2025..
> what's "Ky" stand for? Can you give a full description here
Regarding the original copyright:
This file was based on a version from the Ky, Inc downstream kernel, which
itself appears to be adapted from earlier SpacemiT sources (dated 2023).
The Orange Pi RV2 board, however, was only released in 2025, suggesting
that the Ky version was likely copied and renamed from earlier generic
SpacemiT files.

In reviewing the Ky downstream tree, I also noticed that several files had
their copyright statements overwritten with "Ky, Inc", while the original
years (e.g., 2023) remained unchanged. This makes the provenance a bit
unclear.

Since I've significantly reworked the file for the actual Orange Pi RV2
hardware, I’d prefer to attribute it under my own name, unless retaining
the original "Ky, Inc" is required.

Please let me know what would be appropriate here.

>> +	memory@0 {
>> +		device_type = "memory";
>> +		reg = <0x0 0x00000000 0x0 0x80000000>;
>> +	};
>> +
>> +	memory@100000000 {
>> +		device_type = "memory";
>> +		reg = <0x1 0x00000000 0x0 0x80000000>;
>> +	};
>> +
> for the memory nodes, there are 2/4/8GB variants from the Link [1], and
> you couldn't cover all of them in one dt
>
> besides, I thought bootloader (u-boot) will populate these info, right?
> so the above nodes isn't really necessary
>
You're absolutely right, U-Boot does populate this information correctly
at runtime. I will remove the memory nodes in the next version.

I also noticed that the aliases section is missing in this version, which
means the chosen.stdout-path = "serial0" reference won’t resolve unless
serial0 = &uart0; is defined. I didn't encounter issues during testing
because I'm overriding the boot command in my Buildroot setup, but I’ll
add the proper aliases node in the next version to ensure upstream
compatibility.

Kind regards,

Hendrik
