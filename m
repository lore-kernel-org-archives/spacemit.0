Received: from mail-yb1-f172.google.com (mail-yb1-f172.google.com [209.85.219.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 875462E7BDB
	for <spacemit@lists.linux.dev>; Tue, 12 Aug 2025 09:23:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754990597; cv=none; b=YxoymMzlUa7OtcIGZ9ulWY1fbrRysYk3jKw1OlCYVQJTtRMMJ1w7j/fyY1gKRMRorWwXTgRSrZCTzyBuZ1zYz4Ok6lhL44xWS1hxm6F/pIsloRO49K+azr9dD1bZruJ73K7jIyMeyht0MlBZ3sy7pAwf2hJvvrzIYX2fOjUO6Ic=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754990597; c=relaxed/simple;
	bh=1t64m70/Ydj3TYOPyqgd4kW/vb05YEGXJfg6UGYXmh4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=oduijhCjfZPr5HVx6s8lKPGk9Uq3luRb2yPotI14V3UZWArTToYYc92WrN90baPg8+iyJqy0gwsmeBmRv6CZWgLo0HP4xprroY1MJImIWnfrcgq8jGjw7xbu00bohKzleKfRETazDEKYHEz3OGPNyjCfI7hWRoBN0dFNLwNeVOk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b=KiY7wWd7; arc=none smtp.client-ip=209.85.219.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b="KiY7wWd7"
Received: by mail-yb1-f172.google.com with SMTP id 3f1490d57ef6-e9179fe8295so908551276.1
        for <spacemit@lists.linux.dev>; Tue, 12 Aug 2025 02:23:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1754990594; x=1755595394; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3oXbJx6E3ijqdJvhjzvA4M+RPwmHgHT1829C53wx0lE=;
        b=KiY7wWd7qS7DjoIlHweyDtHXxjcvC6ShsF8WWwTwsiyMv8dJtj+xtOom6J70Fn+Nca
         u7Q8EpHHIG3w8cs6m2Q0vqjT1i+sm1F/uBTTvwtVaILm/5KO/LeR/7CpFKkwaoOvcJlE
         imk4mtV7dTZGFWInd+3IJbrsTdSSFS7rRgrgS//vW8sSgXNybb73BLe2uvCOj5EId6kb
         ouVCDDH83s6/2m6pTPlZ5uqoIqN6ZAEZ+/0muBXT3smV7pTNx6vAR0IXtN84QAz+cuNP
         K24YP4R0aSBwprywkednvfiWhOjkJW3meZ9mutaBKcL+DdVWLy4JoE3mys3zmSTyfr4W
         YOWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754990594; x=1755595394;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3oXbJx6E3ijqdJvhjzvA4M+RPwmHgHT1829C53wx0lE=;
        b=p7uE3mQySKcEPvSc6/pZoke/seb+Z5a/CavW1VgazSO9l+HVQ40DzmislQYZHRmhU1
         e+EbzGBIVKAJicV2wD5tQM+31+PH0zYIOyO782GDRjddUjDJiz9IXZDIROuUY1Vfka+b
         3OB0otxkOqx/GIQVgZ+HczASMtORS0EylhOt7MY8QFvOlC0zEy+FVsOkKEEyd9f1D86o
         txe44Cfe5Y5qHK+WPQwZR1+8WpPUFX80h8vwbGHAkVdUDIS91jj0yeAB1DFVimj4kZO0
         xi5ampex+W5H1j/XXbLeV5KLEZPIZFYpLjq5uWg6e/auiR2870px5jH5X7tmJMiXN+Na
         0TUw==
X-Forwarded-Encrypted: i=1; AJvYcCVGVwNLO4zU2ePETEcPDNt+CVQ8CoVQa+sW6T9WFKcCrhZDJ5ngQR7js6me8eYQhNTNpfJGfp+ooQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YxXIVs7+um3Y745e94yY67gzrGbVspofH+rYXMEsOvCeGWSmh2I
	mRB4Pz9tIJ5XP6yrcgAmwzJIZEDDuWP+YdCLP7Mvwz01LXAgLdZUykdJCryaH+w4BiyXvqPTPBT
	qglM/phzFha52d6VwaE6RVqt9QxYyaItCnZAUFjItoA==
X-Gm-Gg: ASbGncv3evTtR8NP32K3QoaiRii8qTsudWYuTnFKNVz68FsRSqnQtywphEkCdixUfkW
	Z5ya8zO8Hz5Ci5xb8qEMaqPHy8VS4AU8gUbXEgOym735OeWExeFR6gV+OK7K24Ba2YoH3/rddXk
	/ezIgNFkym2TvNLzlFBdDhtXIoRfAqcgvwQe9x2Jh8lpov56Iax0BtHY03SVhORiBThrygVeID1
	+f3yA==
X-Google-Smtp-Source: AGHT+IH77Kjt8YC9sfRPn8ADNNC7hjxOUoD/Dna6Dolf20ZY+41dtteIkmZw9xyyoKWcmYqmqjNzYuop1VYhnZfQUKU=
X-Received: by 2002:a05:690c:46c9:b0:71c:1a46:48d6 with SMTP id
 00721157ae682-71c42964fc4mr37731957b3.1.1754990594494; Tue, 12 Aug 2025
 02:23:14 -0700 (PDT)
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250714-working_dma_0701_v2-v3-0-8b0f5cd71595@riscstar.com> <20250714-working_dma_0701_v2-v3-4-8b0f5cd71595@riscstar.com>
In-Reply-To: <20250714-working_dma_0701_v2-v3-4-8b0f5cd71595@riscstar.com>
From: Guodong Xu <guodong@riscstar.com>
Date: Tue, 12 Aug 2025 17:23:02 +0800
X-Gm-Features: Ac12FXzwCXGXSKiwmxKY93OBxvFdFv-jw-xOzVu8Q_eshKd5oaEN163nC5iHGgE
Message-ID: <CAH1PCMYtYfJYAt_Ah4WW_ps3tPuYLMvanKExhk9t_VRHkRwnng@mail.gmail.com>
Subject: Re: [PATCH v3 4/8] dmaengine: mmp_pdma: Add operations structure for
 controller abstraction
To: Vinod Koul <vkoul@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Yixun Lan <dlan@gentoo.org>, 
	=?UTF-8?Q?Duje_Mihanovi=C4=87?= <duje.mihanovic@skole.hr>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>
Cc: Alex Elder <elder@riscstar.com>, Vivian Wang <wangruikang@iscas.ac.cn>, 
	dmaengine@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
	spacemit@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi, Vinod

Just a gentle reminder on this patch series. I've incorporated your
feedback from v1 by splitting the work into two independent patches:
 - this patch: [PATCH v3 4/8] dmaengine: mmp_pdma: Add operations structure
                              for controller abstraction
 - next patch: [PATCH v3 5/8] dmaengine: mmp_pdma: Add SpacemiT K1 PDMA
                              support with 64-bit addressing

Could you please take another look when you have a moment?

Thank you very much.

BR,
Guodong Xu

On Mon, Jul 14, 2025 at 5:40=E2=80=AFPM Guodong Xu <guodong@riscstar.com> w=
rote:
>
> Introduce mmp_pdma_ops structure to abstract 32-bit addressing operations
> and enable support for different controller variants. This prepares for
> adding 64-bit addressing support.
>
> The ops structure includes:
> - Hardware register operations (read/write DDADR, DSADR, DTADR)
> - Descriptor memory operations (manipulate descriptor structs)
> - Controller configuration (run bits, DMA mask)
>
> Convert existing 32-bit operations to use the new abstraction layer
> while maintaining backward compatibility.
>
> Signed-off-by: Guodong Xu <guodong@riscstar.com>
> ---
> v3: No change.
> v2: New patch, introduce mmp_pdma_ops for 32-bit addressing operations.
> ---
>  drivers/dma/mmp_pdma.c | 187 +++++++++++++++++++++++++++++++++++++++++--=
------
>  1 file changed, 156 insertions(+), 31 deletions(-)
>
