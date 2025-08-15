Received: from mail-yb1-f182.google.com (mail-yb1-f182.google.com [209.85.219.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3635D347C3
	for <spacemit@lists.linux.dev>; Fri, 15 Aug 2025 00:28:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755217719; cv=none; b=G3UQ8HW+WpwitqocQzfCtReOhIlVl6pluLHHFd+dVvPBK0cbtSWsP3olsxZW7Nk3ztDzaZpHuUOAn0pCU909X+G5/OeOPJQPsdom2kMSBvpM/HDEcCtljAGwymq0D3I33MdGSWmDa84HI1FDxkabit+egITSqnolwCOmdot4mmM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755217719; c=relaxed/simple;
	bh=yVKMqWKrf5rQ1fctBmoCT+YVt0KEBHfv/Hl5qX2iIME=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=afbgH7DEO9KgrqkCQFEkKKbJNUciSYW1jBIG1ikhB1ibFteMjvRtpi401MoFVR9SZ155/wGuPTJydbhwzQJ8hhbpBPowHXYfs9oe4oQuOKHaecj8H7ZLDxwwSY7Vu+m7FX1ILDp6WCEQ5c8sp1wnCRsBN06OgmPYoH4ccGC4yaA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b=CBiFUZMg; arc=none smtp.client-ip=209.85.219.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b="CBiFUZMg"
Received: by mail-yb1-f182.google.com with SMTP id 3f1490d57ef6-e931cdc2e4bso1599630276.3
        for <spacemit@lists.linux.dev>; Thu, 14 Aug 2025 17:28:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1755217716; x=1755822516; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WhYHAOHHcTMvb/JsfZaG+H6/8e/UtvwiyrLLiJuYoaU=;
        b=CBiFUZMgitLaqN/E9b8URhfFZ2yVL6PoRkU5Y9td/7AKxd9ch5UCSci1bmAh6TU7zV
         ki7pDKIuLiJ4n2co2sBpfPFKD6FXhX+3aTd0ikWpAb8anf1WKv+OyfoDvwJbmD089UWG
         bxbI9uq67xSdBXpkjeXlN/Fvg+FCUHVYuKqIp7k0WSMXEcvP6rflDBqj24R4JZLEgTly
         x62R53g99lIcvP4cbmYwozPzzDsA6sn7UFFY7druRkzcesC0Ce6KmloQbk2i24xHcRBT
         pWnlZVfnf3+qbQ1QXY2r15HnVpWmmyzzqBSA3emfE/Bhg9qSAlaKaVm93/eutUouiRUG
         Aouw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755217716; x=1755822516;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WhYHAOHHcTMvb/JsfZaG+H6/8e/UtvwiyrLLiJuYoaU=;
        b=R0gRL1vnJzUPYhvu8M8HHX0zopNrPWzGn13KxPb7T/fNOEx0RnEjyHiy3BM43f+Mku
         Uz36Qb08BSg9rHOHS/kVL2/PPKgZpzuDZ+WJhFARolKfvRSe5OMwxZAcxcxlsFtgSrBq
         YdbRJz3+tbhEXjXiiXgjwQhvDilid8b9QMLZsJfvZTDaTWZ9TnvSe6/W2qDP+iXD1ElE
         f7FceHjDQiuicsZs4cC5kb/5LeZyPTDVp65ZvqyGaRJim3vy66e9cSnsTqLrUG23/q3Y
         Ibd9CLFjQ0bZ/59J2nSaCzPnDAxGoMZ/TYDnQYiIaxLbQ8iIPcgg3PpHfZVKe5DAH/PC
         xxmw==
X-Forwarded-Encrypted: i=1; AJvYcCUATabq1B8kf6fG+HRClpM6MgfFqb9VeUN0Vdh+EZEUURzlz403FoTN8pO+83sgbRmYCKOdeG8x6w==@lists.linux.dev
X-Gm-Message-State: AOJu0Yz4eCo+C9MuNr3WFPnxecydc8PXJF92RtgjI/V0y5g4sEYpcaLg
	zdz42aUpgnmGKhJvitHiXDQQOnjhTALxz2wVPW+yTjPsvYnxISpbort/DXspSLR6Kwq9j38AhQ8
	wALD2/LQGyuEbNitCpM4F27g6yYLoUJyNQLz1iVTkLQ==
X-Gm-Gg: ASbGncvvbT0mP8fY42AaI6poCuqQT2ElcHNah2AX0yWcslc0psPAdc7XIzfEvs5Vhi4
	PzOnUwQOwG7jGQNw16a7pe0/wG/OXc9weVjLbFw4yfqKGBRYNhFZLOLcBUc4ha4PG7mgh3KRmp3
	BZ0ZdsBQbTtr/a3Bfi9kzrG7hRHpxfBxr1FfI+qe/m4tgrq6+MAUC7D9y9TeDcMpOPqGMtsjAbe
	Ickmk9w
X-Google-Smtp-Source: AGHT+IEWHgZsAdK4qEvDGvsR02TXcwc61mkjg/mahmDjUByNY1vc8hT9AhSsb4gPaZW5ujgSq5lJQRMSMiPVldUmqB0=
X-Received: by 2002:a05:6902:70f:b0:e93:2f07:3fd2 with SMTP id
 3f1490d57ef6-e93323846bfmr333872276.5.1755217716217; Thu, 14 Aug 2025
 17:28:36 -0700 (PDT)
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250714-working_dma_0701_v2-v3-0-8b0f5cd71595@riscstar.com> <268633D49B18C3E7+aJxMHPhItPq9ioto@LT-Guozexi>
In-Reply-To: <268633D49B18C3E7+aJxMHPhItPq9ioto@LT-Guozexi>
From: Guodong Xu <guodong@riscstar.com>
Date: Fri, 15 Aug 2025 08:28:24 +0800
X-Gm-Features: Ac12FXxnSnbbKz6jQ95n94znx3YpWdrJ0lK8qAhRBPKv8TxP7rZpNGXhbYfh50Q
Message-ID: <CAH1PCMaMm+aDXG4AfPbZ_iJQW2cuKY=VMU2_C1k6Vi3cBBSthQ@mail.gmail.com>
Subject: Re: [PATCH v3 0/8] dmaengine: mmp_pdma: Add SpacemiT K1 SoC support
 with 64-bit addressing
To: Troy Mitchell <troy.mitchell@linux.spacemit.com>
Cc: Vinod Koul <vkoul@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Yixun Lan <dlan@gentoo.org>, 
	=?UTF-8?Q?Duje_Mihanovi=C4=87?= <duje.mihanovic@skole.hr>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, Alex Elder <elder@riscstar.com>, 
	Vivian Wang <wangruikang@iscas.ac.cn>, dmaengine@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-riscv@lists.infradead.org, spacemit@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Aug 13, 2025 at 4:26=E2=80=AFPM Troy Mitchell
<troy.mitchell@linux.spacemit.com> wrote:
>
> Hi Guodong, thanks for your patches!
>
> I have tested it using i2s and dma-tetst.
>
> Tested-by: Troy Mitchell <troy.mitchell@linux.spacemit.com>
>
>                 - Troy
>

Thanks Troy.
