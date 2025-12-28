Received: from mail-qk1-f196.google.com (mail-qk1-f196.google.com [209.85.222.196])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E819D26CE3F
	for <spacemit@lists.linux.dev>; Sun, 28 Dec 2025 23:50:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.196
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766965820; cv=none; b=GACRP5wklFO/nPHwLt+q5sWFVETZl/Ab6b5zKl5V4V/bvdXU1d/W/eX1VxVIukTdco29kMmx9pL4HzJXyuIX8N3bVynvtaxDQkp7Zi63rU5kOklxUCxAaAcirZ3h/mIFy8/Q7xdvWGKNwWPWevyJZw2XZeKljEIOkavnhMQuzng=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766965820; c=relaxed/simple;
	bh=2w0A7ymf9jXbqKrPGnI5Cug27+M1AwvX/RchOIlL1II=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Mk5pYl++0WKmDItZf5K7uaqoMlvQrpoyzCVAfymhXYCh96aE5CMHFK40h4eakAqApt4M413IuKXJ5bPuieXnn6gpq5cdp/EVIEE+oHGyu9nIEivQ2Fuhdcl7srL7hVBBj1ZhAAFQhVk/OrQenJXCoJyKzsSlg8vDnjGanB4Ywxo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b=udOGQJJZ; arc=none smtp.client-ip=209.85.222.196
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b="udOGQJJZ"
Received: by mail-qk1-f196.google.com with SMTP id af79cd13be357-8c0f15e8247so933501485a.3
        for <spacemit@lists.linux.dev>; Sun, 28 Dec 2025 15:50:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1766965818; x=1767570618; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=GpN54oVgQguU3p5JgPy3uhgmnh+wgxqdR+Icp20pf+8=;
        b=udOGQJJZWgD6vHd3A2CjP8jW+5h/+aEGhchA4gfHG6yc3MAIACyWREjMNv49objCgW
         e1JRfeBl4emyKvRZ+49jmoipm9FAz8a22YtfYzNx8CYNTXkZ+kBUWomu2Hm7+EGbbOoU
         rlCUtchYYzo5gJqTpRPAz1v4CLf2R8rvxTxX/u/z/9zfTckA/5lvcdIkCCDH0KhoOCrh
         G3jxgOWwJ0ThLSxZLq0wxvcV7T+gVaphaaGagzHDzrY3XqDv6QG+3BMSofNWa8sqeztg
         oDRAnRRHAKWECKc/MyaNkyEZjfDEY7kPQGmf48jP1zpXRScCsPO6qtyrCR1nZk3EK7zM
         YD+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766965818; x=1767570618;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GpN54oVgQguU3p5JgPy3uhgmnh+wgxqdR+Icp20pf+8=;
        b=JltY/x+tUQJwd5k/1pBJOkOZGPG997kpfo69nJNlnC/du2C7KXLcVdxe4oe5o6LrCT
         btB/lWSZfUXPFOUnkyLFRjP6p/Uh6J+HKAQ2Of8VyqyI8/rVjKQq+lVDnvKHiFIHHMR8
         5EiNOcY10ieI6rH1ECTVJGSPKJ5E6Syrnkz3OcBWddlwuzMmeQTTEm6G9SEfFs47A5sF
         89Apnono+c7D8XMR1YTiCSSlKyRaKsbKsnDY7o/P3pbZ1Cxt7tGl3soesJ5h+JXr8FTU
         G+OzdlYE+oPWmYHXM+8w//j9xRQ+1Yc0dpJDdUHsZBclR5aqn+Rcjd8ode4ABI24xM0J
         Kj/g==
X-Forwarded-Encrypted: i=1; AJvYcCW/uI3BygpEXr0HccrOJcbJ4nlrhwKlpC7tf5vYfb15+Bq8Wh0Lbiv0G+PBuVkiDuS6pO9bQ/+fmA==@lists.linux.dev
X-Gm-Message-State: AOJu0Yx0UzfLQHJ/wI2J2I3k3iYe8g38Jv42UvKITPpEsKpQNSX3jnFz
	eRY0SpAkyJdZvBAWwtpn1pjOAnTk6Q8wTTYBKVPhUkyNPARWdSff2rddI6gmxMQKM4s=
X-Gm-Gg: AY/fxX7KCpMjuzzZNpbEDAe3rkCfLSzbwqghiHRMtwSurA9BTHEskwWIcweTOQqNpNz
	xnEGvCbab11tWKfUZCXh2OqRzT/1or/QR9EhuG+4rIav+ymdja4WxQJ7r/rM7k5tutZsyuwvhMx
	tfmnuLgG2TtIiOdK1ZcvxmyYvu3iovkP13zi0dG0Todp2RXR0n4NHL8SwKaGY+2OdcIaNi6xQhI
	ARGCNIMzW9jGLbutIvLrIJyljPFuRoK+F3FBmCCjtwwuHJAKMCNz6HJyfL/vTHEGVne1y9kHLKn
	vWfak96TIBBkxQMiyqIbLK+I7liKnVV4aKVTvK0UWnOrdOfrh43a0lP7Xz2SkfZBr3K81734QEk
	KBgGNaVivIgKI6ZP3w3Ga9mSr+CziySxLSOhHQRMnQrGiVkEwKkSM6u2QPcY3F6SJiS92ick635
	l9tc+IWzut08tcBLekgyoSdWrMvkn9b7OmNbiWHEv2MPJzrNMwAPA=
X-Google-Smtp-Source: AGHT+IEGbKgRTG08k8rXERBJismFkK/tDgJdZx5wXocvbU/vsRR/qDK2KUySLLUQVB2beTsVWlcMDw==
X-Received: by 2002:a05:620a:29c7:b0:809:eb12:1ea0 with SMTP id af79cd13be357-8c08fd18b81mr4252356785a.81.1766965817857;
        Sun, 28 Dec 2025 15:50:17 -0800 (PST)
Received: from [172.22.22.28] (c-75-72-117-212.hsd1.mn.comcast.net. [75.72.117.212])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8c0973f28e3sm2406423185a.45.2025.12.28.15.50.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 28 Dec 2025 15:50:17 -0800 (PST)
Message-ID: <5979c8ef-b0fa-40c8-944d-96e226fbcbe8@riscstar.com>
Date: Sun, 28 Dec 2025 17:50:14 -0600
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 07/13] dt-bindings: riscv: Add B ISA extension
 description
To: Guodong Xu <guodong@riscstar.com>
Cc: Conor Dooley <conor@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Paul Walmsley <pjw@kernel.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Alexandre Ghiti <alex@ghiti.fr>, Yixun Lan <dlan@gentoo.org>,
 Daniel Lezcano <daniel.lezcano@linaro.org>,
 Thomas Gleixner <tglx@linutronix.de>,
 Samuel Holland <samuel.holland@sifive.com>, Anup Patel
 <anup@brainfault.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Jiri Slaby <jirislaby@kernel.org>, Lubomir Rintel <lkundrak@v3.sk>,
 Yangyu Chen <cyy@cyyself.name>, Paul Walmsley <paul.walmsley@sifive.com>,
 Heinrich Schuchardt <xypron.glpk@gmx.de>,
 Kevin Meng Zhang <zhangmeng.kevin@linux.spacemit.com>,
 Andrew Jones <ajones@ventanamicro.com>, devicetree@vger.kernel.org,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 spacemit@lists.linux.dev, linux-serial@vger.kernel.org
References: <20251222-k3-basic-dt-v2-0-3af3f3cd0f8a@riscstar.com>
 <20251222-k3-basic-dt-v2-7-3af3f3cd0f8a@riscstar.com>
 <20251222-stitch-preachy-3fab87fd6f0f@spud>
 <CAH1PCMZ7ywZ3unLy0yHYK+fFHk0y=q2cEtPnRi=qSpf=fc75rw@mail.gmail.com>
 <66c0676a-7920-4825-b916-3c00b1648a08@riscstar.com>
 <CAH1PCMbBURb=DpChf+Y-DjYjzpXG-pKgoaHAu=TUuG4oVC56cg@mail.gmail.com>
Content-Language: en-US
From: Alex Elder <elder@riscstar.com>
In-Reply-To: <CAH1PCMbBURb=DpChf+Y-DjYjzpXG-pKgoaHAu=TUuG4oVC56cg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 12/27/25 8:51 PM, Guodong Xu wrote:
>> That's what I understand it to mean, anyway.
>>     https://github.com/riscv/riscv-b
>>
>> There's no point in supporting "b" in devicetree to represent
>> the others if it also requires the others to be present.
>>
>> I think that, instead, "b", "zba", "zbb", and "zbs" should all
>> be allowed.
>>
>> I might even go further and harden the requirement, saying that
>> if you specify "b" you should*not* specify "zba", "zbb", or "zbs".
> Historical reasons here. "b" came too late. The chip vendors have published
> cores with "zba", "zbb", and "zbs"already.
> 
> That's a migration bridge to require "b" must be listed
> together with the other three.

Are you saying "b" has already been included with "zba", "zbb", and
"zbs" in an existing DTS file?

What I'm suggesting is that (unless someone has already done this in
a DTS file), there is no reason to require "b" *and* the other three.
You should allow either "b" *or* all of the other three, not both.
That would support older platforms as well as newer ones that use
the more concise "b" only.

					-Alex
