Received: from mail-yb1-f182.google.com (mail-yb1-f182.google.com [209.85.219.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79A1C1C3027
	for <spacemit@lists.linux.dev>; Fri, 15 Aug 2025 00:27:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755217670; cv=none; b=gYG9bR3vlRlLUMny7Enl0AACnZFbY68bdVeuCxUHT+I31c0G/dw+ZnM/YrsriuVbtHOUY4fPmkoFBGOjlnHx+pPCqaJirtY7RAeBojo6qnWRINwten9XC7qKKF+4hcbh4egbdP1KVHkPF7bbqZTYyobYtfgEJIqyRJfQbGobok0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755217670; c=relaxed/simple;
	bh=X8L6NYOi7CRlSxcL8t2PnnNxl7kf+iXyLMU7O1KY670=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=HOX9YF0Kl4dnpx18rPd8YXbabzffO3Agab0whzuuJnAGGIlPgMa7+eXQypCnyDdyZw3Th56Qzeqc/SYksi3odlK6yKPHZa7xS19BfAAjv4KUnF+taRxsT/0XD5qeFwxjz68wjUQq3YNqOBaVNVIMk5mn3LOsXck7+tgk1vF6r8g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b=bgYqNoDo; arc=none smtp.client-ip=209.85.219.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b="bgYqNoDo"
Received: by mail-yb1-f182.google.com with SMTP id 3f1490d57ef6-e931c866031so1556286276.0
        for <spacemit@lists.linux.dev>; Thu, 14 Aug 2025 17:27:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1755217667; x=1755822467; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MUCl8OpntS8ItAPbimfsEK2ia5Dsdkh5KT5jw4r6KqE=;
        b=bgYqNoDoi9MmFI3D+RQLyrXDGvHyzzDy/ZyC/KFMrjkFMAENJU3GkFuCW3we22q1FC
         P/oL40K/MrsWYFpS6EZ56G/5RqHfcLGr+gPsgt7MSVgTSBGx6OqNC7I3+ZQuF6OYYNIX
         bi9K6z5tYvIv1LxIrgLu9ssipNlXElRcGzeugk4fJH4pwWuMQXhVPHpe+++6w5Kr9lRg
         xtnw435BdFYhCXRg/qHiwfuj3Q2TslKynkqihJ/JzVoBlfx3p7GhuVMcjrJR3tIn4o1n
         8IRcOr8lbMGRHUYmK2sdQgyYzZb4v+CbQZdTFK/3JxeUV7mHYYgibF3uds4tZSFVmUkb
         w3nQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755217667; x=1755822467;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MUCl8OpntS8ItAPbimfsEK2ia5Dsdkh5KT5jw4r6KqE=;
        b=eNhIIlwpsFO6/N/qijswx1Ytt9kVibtN4uuRoLXupqwQvFrMrfxKra7+KlmGUKlls0
         Ww5+GurAo2MvW5oCjlmoe6tGvJY38tsYpLk+xU2NS4cCJdz8srPDbwdVZr42ga7aBwLU
         YyRUoQlE/ITsQ79rAkcIFLX7/BbCV+SNw32Fh2ZXCRecnbP0E2XmQrcFs7ntZIG5PMzp
         jSjUOLb9klaAntG6fbt5p6xMrRj1DsIn6BFVQir70FrsK96GVyjxxjBu2LeX0uMa9BN6
         kyLVEpaY36uUSJtjaCXt+i1XLuE7xM6cbHXQUtTnr+U/fVTy0VW9x62GXjPDQT9R3TlC
         xRaw==
X-Forwarded-Encrypted: i=1; AJvYcCXFxbdDG8pgKXaAlQ03pQcY0rYBKgiAXRN3bA2AG3hP2y8xDMVUy+Dc9unsKSWxp1DwUQ/jwgwXnQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YzT02v4pNBl+k8Va8Qoq9rY1aNspM9buLducDd4fmgq0WM9ofsS
	gfuDPfpV/pY5bmZajUU0VBu8KBlS1IArKXWJAR8u7U5qbVB9d+eIkrKVxz2JR3TyodO7nrfxZhY
	jFB7L413Jl7Qhxd5v881kgtBNiwQuCYcqNslp59dVyA==
X-Gm-Gg: ASbGnctB2INis9ODO6n3oL7UNrHCj9pko8+eyPKH7FtHG2X7Xp8gjOBw6YInlJ97Qx/
	+6ZLL0HRvgeUSk0kBnSlLNNIbhv2ryvUarPW7FCJKxjBy/7el0VtR7r8xoRjK3WHyJXSb38MjSa
	RGN1pK41USFzCh4F2aoaFQn1PdtlDKIiscq5QQHueONNit7AaytGgZQXzgTpm5Btc5n61gOeTCV
	yKzoWQW
X-Google-Smtp-Source: AGHT+IFr4Z98dVmGfz60J9x6/CkZNbrFkAtGVlc71VNieoJ/ZNAByVYswqD8H1LwHZHBqhIOt7I8+tOkzgyQcZyNca4=
X-Received: by 2002:a05:6902:270a:b0:e90:8278:5f2f with SMTP id
 3f1490d57ef6-e933251c90bmr227607276.48.1755217667411; Thu, 14 Aug 2025
 17:27:47 -0700 (PDT)
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250714-working_dma_0701_v2-v3-0-8b0f5cd71595@riscstar.com>
 <20250714-working_dma_0701_v2-v3-1-8b0f5cd71595@riscstar.com> <175255113305.1485.18050987625765048681.robh@kernel.org>
In-Reply-To: <175255113305.1485.18050987625765048681.robh@kernel.org>
From: Guodong Xu <guodong@riscstar.com>
Date: Fri, 15 Aug 2025 08:27:35 +0800
X-Gm-Features: Ac12FXwajLIeOVETGqUxgx2qIW1SxmU-t78A8xhxjUwRc93jsVMDeN2uzl944DA
Message-ID: <CAH1PCMbpxUHfFbBCDYYE6F+DCJHyHoesf=9f-Sw0p=147vEQag@mail.gmail.com>
Subject: Re: [PATCH v3 1/8] dt-bindings: dma: Add SpacemiT K1 PDMA controller
To: "Rob Herring (Arm)" <robh@kernel.org>
Cc: dmaengine@vger.kernel.org, Albert Ou <aou@eecs.berkeley.edu>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Vivian Wang <wangruikang@iscas.ac.cn>, 
	Alex Elder <elder@riscstar.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Yixun Lan <dlan@gentoo.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Conor Dooley <conor+dt@kernel.org>, 
	Alexandre Ghiti <alex@ghiti.fr>, Vinod Koul <vkoul@kernel.org>, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, spacemit@lists.linux.dev, 
	Paul Walmsley <paul.walmsley@sifive.com>, linux-riscv@lists.infradead.org, 
	=?UTF-8?Q?Duje_Mihanovi=C4=87?= <duje.mihanovic@skole.hr>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jul 15, 2025 at 11:45=E2=80=AFAM Rob Herring (Arm) <robh@kernel.org=
> wrote:
>
>
> On Mon, 14 Jul 2025 17:39:28 +0800, Guodong Xu wrote:
> > Add device tree binding documentation for the SpacemiT K1 PDMA
> > controller.
> >
> > Signed-off-by: Guodong Xu <guodong@riscstar.com>
> > ---
> > v3: New patch.
> > ---
> >  .../devicetree/bindings/dma/spacemit,k1-pdma.yaml  | 68 ++++++++++++++=
++++++++
> >  1 file changed, 68 insertions(+)
> >
>
> Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
>

Thanks Rob.
