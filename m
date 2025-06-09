Received: from mail-yb1-f175.google.com (mail-yb1-f175.google.com [209.85.219.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCEBB258CFF
	for <spacemit@lists.linux.dev>; Mon,  9 Jun 2025 14:25:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749479141; cv=none; b=HhTId/u22PY2ln5UjCy7kWafxu08RVyqXwU3eXg1vIaK2tO0AjqqilHnxyzT/6lSylpIxDj0FZDvO2SxYnOlNOkj/bwOehMjPAf4FtiRHX520IFiSqQY6z/p2s3Vu4TGG28Bc7A0NnlUvNSpTKZn/KAH5eFUz4mdwZ9M6ocMh38=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749479141; c=relaxed/simple;
	bh=kyCZGylePIRPc6/p6l1PQEVjFz3QH7t1Uv+tm5q9j3E=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=XiANugmX+B/7acyUntfmbB5q6e1jwGYhm87ijM+Ib401hVjy5XWPJpCsKR89r1/Y8zDCQ26IcjUYrdRudKyX2mtHQfUUtqmB2/HsK6BHpBUdf4a6AZIj9RIpS7l9FfZXzwzS50tlH/C4mYgzGd8qAbMuQttF9jnQTRo0ynCcq5w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=HN89P1th; arc=none smtp.client-ip=209.85.219.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="HN89P1th"
Received: by mail-yb1-f175.google.com with SMTP id 3f1490d57ef6-e81749142b3so3778224276.3
        for <spacemit@lists.linux.dev>; Mon, 09 Jun 2025 07:25:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1749479138; x=1750083938; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=08IPBfBcl0I5u93yG1iOBKn0aIO2SlE43zAjUb4+G4A=;
        b=HN89P1thOFquzfe9VQ7N51pnlvfxuN1y00anqiI4oMQNb+sbpdXIAd/REM1UxyoRUH
         YJnLGVmQFEAwt/5mQD5wCj7B2O+TYXS8SZ0K0v1xb8QNZyQPTVYVzQfUlaK0RgCxpYaY
         GFRbZQNMn2aqZ66XX+CyE4HIIiLZHRJvQgT8QWTxSNsvIAGXiZdbOys+PEu9bSG3Ox5Z
         qVGdBvGoPvdCO85BAKC9W7OofhF+HTdifnbFE5acmemM7FiUdHwHA4H36D1yZtDteLGN
         z8sUKy08FE60YqfvthJTjyUWlevMUlM3Z5lKqklECmWaIn0+3j5B45vV5iR6NJjFbn2c
         z2fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749479138; x=1750083938;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=08IPBfBcl0I5u93yG1iOBKn0aIO2SlE43zAjUb4+G4A=;
        b=sR+kIbWJ3TCc6eliY7RmJvEk8dDJ8/teOiwrsfHggWMMeSg67IUakhiqVdWE3uzarQ
         bcxOYh+1o2x5FU1AzY1Rzr8Nl0oLYNVIJwcusggButlkOcBfJT6PiqqcOu+mzTSUAaqG
         cit3aTLueGpKjSvkaVbyNncXhpmPPSdf6TDKZ6pBHO6dxVr3U1JQEGHX5bFJkO/7sSk4
         RHX22RSZtY9kMyCa7WVoKZWQe/BI2I0OPKpvqbY//SgDZIXRIw6zec4B2Qk6FhQC+ttE
         Qr6HJJ/wtBTFzUViePzwHzjQn4uZ4cMJVnNR/7zHhtpwSn7M+i4nLSJ+oXJhJY0Z31zC
         BU6w==
X-Forwarded-Encrypted: i=1; AJvYcCXhPJXfIcKRpQfmFIZMLtOd00AEph1BQjlgb6WtR01L1BLD33RDXl4UYrKRsVA4T6b6UIb6j4pexQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YxMb/tnFvE5BrwJr0ru2GGZveIVF//lvwHi+VhPRh+/kjqtve7N
	O7VcSKLQAKNW0pMs+3jSNMrrh9iRxEyxQ0GkEKTTRO643+nPDNsbygSgxbDczOPWocyUTxbZrz1
	1o5qYUlEBk4XWIxqGRDcKl/Y6qRwUhJPuRrcDNdCj0g==
X-Gm-Gg: ASbGnctE2ouHhtb3Uea5lnVU7jB+83P0yHW09EPpPDfvWMyaFYhgN/tgfre2RqO8N8q
	Sfkvkdx2zX91Y5El5Swx+56gZYM63q8mwPqtV6eBjkw/qJ+uYECOr+KBHV6UgCkS+R4tOx9AHtR
	0lgrBzWIHak9qqV7+c5qhoIMa29Cuu81MHmjVtikzM4gtB
X-Google-Smtp-Source: AGHT+IFJR4aUEYQFFbDZaS8lUqINbO+uSj5liG0a2YzJSs3reQoye8CT00DeZ0MCmOmCgc5uVI1W+JPgVoRQgVJQkXI=
X-Received: by 2002:a05:6902:2d82:b0:e81:9581:4b8d with SMTP id
 3f1490d57ef6-e81a22e28damr12881553276.27.1749479137932; Mon, 09 Jun 2025
 07:25:37 -0700 (PDT)
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250523-21-k1-sdhci-v1-0-9f293116a7e7@gentoo.org>
In-Reply-To: <20250523-21-k1-sdhci-v1-0-9f293116a7e7@gentoo.org>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Mon, 9 Jun 2025 16:25:02 +0200
X-Gm-Features: AX0GCFurOqp9D4c4_5rdTPaeyNA34lDzrdQDOcopYfWdJ2pwCdIenMEDwksvwR0
Message-ID: <CAPDyKFqUkjG8=f35CmGmTjN60_HzGnF7XihK7t8X1KA=kNSGig@mail.gmail.com>
Subject: Re: [PATCH 0/2] sdhci: spacemit: improvement of register defintion
 and HW busy detection
To: Yixun Lan <dlan@gentoo.org>
Cc: Adrian Hunter <adrian.hunter@intel.com>, linux-mmc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
	spacemit@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

On Fri, 23 May 2025 at 16:47, Yixun Lan <dlan@gentoo.org> wrote:
>
> These series address two comments from Ulf during the review cycle
> of version 2 [1].
>
> - improve register/BITs definition to make them less generic
> - drop MMC_CAP_WAIT_WHILE_BUSY flag to disable HW busy detection,
>   this is tested on Bananapi-F3 board.
>
> Link: https://lore.kernel.org/all/CAPDyKFoDWS6DWdKOaxTDEYeKv3hjVDoR7XGi19nESVssc-RG8g@mail.gmail.com/ [1]
> Signed-off-by: Yixun Lan <dlan@gentoo.org>
> ---
> Yixun Lan (2):
>       mmc: sdhci-of-k1: make register definition vendor specific
>       mmc: sdhci-of-k1: disable HW busy detection
>
>  drivers/mmc/host/sdhci-of-k1.c | 140 +++++++++++++++++++++--------------------
>  1 file changed, 72 insertions(+), 68 deletions(-)
> ---
> base-commit: f7f05c5ea4af0f28cccfa49fe1af65e85dba5ef6
> change-id: 20250522-21-k1-sdhci-c987fd67c82f
>
> Best regards,
> --
> Yixun Lan

Applied for next, thanks!

Kind regards
Uffe
