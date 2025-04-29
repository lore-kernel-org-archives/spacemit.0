Received: from mail-io1-f45.google.com (mail-io1-f45.google.com [209.85.166.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8CF6726A0CA
	for <spacemit@lists.linux.dev>; Tue, 29 Apr 2025 21:44:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745963085; cv=none; b=biMm+s+qnkoThes/WO5bHSCUb/ErTF/Vrgmh35Qkk08zTyHrN/TKAgBJfaTrTozm7yAKkpbI1M8iifUqI/llxS0ZzRNl4VLnCbJlmM4hDtt6tRbrGILNHcrjt8VMabXVme7cgSAZSDf2Q654F47KhFYlmXKuJU0mnutgapkfPPY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745963085; c=relaxed/simple;
	bh=YoNC21QRpvSFFog1sIo2pHLhmbI9Jf1P9KZW35k1YSc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=GYXl0ZeCkHZmCWmwrvJNiO0uPCbUV5ugdkm2ZRHP6H93uHiMJXUkO0J6QNd0FEKXdH+pyCuS4qPdNE2N0q4aTpLLfWmWGltYQExndIlUrBNIoT5cgMtWk7lrNg9Ls0ac4Ocj053E/BaKBmOvEV/TRqS+IQKCr5B8qlW7wjlhN8M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b=G52FcQOJ; arc=none smtp.client-ip=209.85.166.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b="G52FcQOJ"
Received: by mail-io1-f45.google.com with SMTP id ca18e2360f4ac-8613f456960so184550239f.1
        for <spacemit@lists.linux.dev>; Tue, 29 Apr 2025 14:44:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1745963082; x=1746567882; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=4jR6+8yIAI0O5mZLd2KMAqTdJoRJKX7IRlTHsSNPOZQ=;
        b=G52FcQOJVM4CBH2UKa22uo3yUw+mMfPfa6xO7sNxn2olBEBqTg4vrxM32XtH0Anvi1
         b/ozKv5FdpRUYl40g7yvn0rzHQlJ10TgJOgIkASIPWsLVG9Uowxefl54Bv5psO0oww2b
         BJw8oatmfFHyqOjmeWR4OUitYjp7wo+2gsTaM5PqT5ZL09j/RnB1be4mh188JJnsWgBD
         1JSWj4n35HhN9l4BxvN1/TIEwxtSLzhnEFIk1YNYFMXDRpjmoK5vxZEIfo575tojG+YX
         w4EoREPcGtNjmpX60JFYU4/DUiB7fWqUGhqOuRYVb51QZlcg6joTmqKPYouVKJ91+qk9
         uuLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745963082; x=1746567882;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=4jR6+8yIAI0O5mZLd2KMAqTdJoRJKX7IRlTHsSNPOZQ=;
        b=l8xC5tDhVUk93Lj4MtFU3wflW5AklIf3YGceFO74fer1uvJwTwT1EWNOUC1WlQqTKL
         bQnNDRkqmdRKxepdR2qazFpbBhPWEt0LfPFZhqZV81NVce95khedDsIItg5H4V4QCyST
         t+SEGiXGd5FgkvsDfjhBcF3HXkTpjVpuUkF5zdyQx927pNGVltJy3VLYVrEGgDEqEmHY
         /EaC1SpwARiAEq3QJkZxXvUr2mOckL5iW6gVUEPv9dzpro0l4Lg49VurVzC4Vzd9ll5K
         BD1gtTm4mkxg/RlpzdBZpt7duzM0L+m5+7RgjNQh+v7qnbLPwZxEwhSfiiYy8GvGLlNp
         wxkg==
X-Forwarded-Encrypted: i=1; AJvYcCUV8dwu0MvXp2910I5trdDCU/NRq1xbX2ajKDECNu5zdsLObN4ruJiCHbsz4CdEQ/We0Lrk1yNmlQ==@lists.linux.dev
X-Gm-Message-State: AOJu0Yxdp58vJMJAAbiboUCJQeOuRfBiCOP1rkEUIpWUGt38L7dvG7oP
	p/EYxeEHwc6HW4XBQZWAOUDHDjCjHhkH0sx40Q0ToHXyZDpc4+MlbRFGa6bVxXU=
X-Gm-Gg: ASbGncv0FV7aXxqC/VJylPxD8HRvoEOtj3o0Bb2cgf8Dy4GlnoBcEsuJZn5BHQtFZDW
	OTe+37lZfaw31YrnIbxKhgSX9PiIYaEWXfptHU6jne2RSZ/AxOOzSdGrdjqpQToy3JehhFhxxDe
	y0tm8cyXK3eDl3iTj2MkLdTGmFwaMUf4o/2BpT0O8iJLemYMby3DB/++Y3QYzO9kzqSCEisnn7T
	YLxDWenTTZvjmOjWfwWhmYrOeTE4zDcn5CmQ8YpU2ReF7Oeo6RRk9c+4fp94JLMI8RDW/4CCMmo
	B38KmshMhRlI/oI3mBLHGseV/sNg2zVsXDE7dnVBQ+oEX2DdKXTNpVtDNQ45++FSs3qTyGxVjSI
	sL61q
X-Google-Smtp-Source: AGHT+IHC804e4Eix/ozoxmgLuYyu4h8EDtpYTI9mJ8DxF3AanIg+BgD1P4qKeHonfHu4YLobsYIF/Q==
X-Received: by 2002:a05:6602:400d:b0:85b:577b:37c9 with SMTP id ca18e2360f4ac-86495f0f44emr144632039f.12.1745963082607;
        Tue, 29 Apr 2025 14:44:42 -0700 (PDT)
Received: from [172.22.22.28] (c-73-228-159-35.hsd1.mn.comcast.net. [73.228.159.35])
        by smtp.gmail.com with ESMTPSA id ca18e2360f4ac-8648c1df315sm42698539f.45.2025.04.29.14.44.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 29 Apr 2025 14:44:42 -0700 (PDT)
Message-ID: <8b345c2e-876a-4528-b8f5-fe97abd11cb4@riscstar.com>
Date: Tue, 29 Apr 2025 16:44:40 -0500
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 0/7] clk: spacemit: add K1 reset support
To: Stephen Boyd <sboyd@kernel.org>, Yixun Lan <dlan@gentoo.org>
Cc: mturquette@baylibre.com, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, p.zabel@pengutronix.de, heylenay@4d2.org,
 guodong@riscstar.com, paul.walmsley@sifive.com, palmer@dabbelt.com,
 aou@eecs.berkeley.edu, spacemit@lists.linux.dev, devicetree@vger.kernel.org,
 linux-clk@vger.kernel.org, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20250418145401.2603648-1-elder@riscstar.com>
 <20250421134218-GYA42923@gentoo>
 <95c672f35d6e5e1ac91feaa5628cf4fe@kernel.org>
Content-Language: en-US
From: Alex Elder <elder@riscstar.com>
In-Reply-To: <95c672f35d6e5e1ac91feaa5628cf4fe@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 4/29/25 3:57 PM, Stephen Boyd wrote:
> Quoting Yixun Lan (2025-04-21 06:42:18)
>> Hi Alex,
>>    I'm good with this version, but would wait a few more days for
>> people to comment before taking them..
>>
>> Hi Philipp,
>>    Since these reset patches [3, 4, 6] are sitting on top of clk driver,
>> I'd assume you're ok with taking them through clk tree? I'd plan to queue
>> them for 6.16.. if yes, would you be able to give an ACK? I'd appreciate!
>>
> 
> No. Please put the reset driver in drivers/reset to get proper review
> from reset maintainers. Use the auxiliary bus to do that when the device
> is both a clk and reset controller.

OK.  I'll send v6 that implements things this way.  Thanks.	-Alex
