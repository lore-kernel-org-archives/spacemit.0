Received: from mail-yw1-f169.google.com (mail-yw1-f169.google.com [209.85.128.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7CDF226CE1E
	for <spacemit@lists.linux.dev>; Sat, 27 Dec 2025 23:54:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766879646; cv=none; b=RE8cMcoge//jIpV9GvZ91BIjYmOEYeQiPBrDf4hi6BO4Zwd/dSIUKYsO9jUDctOAKq10wVLcbyCBCCxv9b/0hVaIAt00j4yaapbZGqBSeNxBxUk+IdPCVCbn4puzQBPzLgRG2rAs+U7tahBMRiZY2HhHDpppPkgrdN7PFyNIARo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766879646; c=relaxed/simple;
	bh=0vAJYJFTVTvQKublqQlzRcmbWps7nPfytE/7e/IWl6M=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Z+jdI3hGNLQxhTcOhqYqrSCUoKSDcPsJZ7qkeWvM+qNn4Mt0hzec/cfQV3nhSmZ2ROWmtaNOYVpB5e9SjMYaXCcF42+uubQNw1X5Xmzfw4/C5qiyx8Z8Z7BPC+Pt9DmSnjwZkdzm1dDSMJdnEckNxkdYNt5p9spPMPryo47Ad9Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b=Daq4VxHL; arc=none smtp.client-ip=209.85.128.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b="Daq4VxHL"
Received: by mail-yw1-f169.google.com with SMTP id 00721157ae682-78fd0cd23faso50029717b3.2
        for <spacemit@lists.linux.dev>; Sat, 27 Dec 2025 15:54:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1766879643; x=1767484443; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0vAJYJFTVTvQKublqQlzRcmbWps7nPfytE/7e/IWl6M=;
        b=Daq4VxHLPrLSkk6WwVI935LpYdwD1ZbEazOpF3nKmeLB3mia10z0TA8xhHGAbHewlt
         h2EwpY0kPNkcW+jYC4zyThjyvcPNVhsCmoGscdlUY2t3GxGeRmGmCC+MJWlJnoo6M+v3
         kr72/JtYPX5l5XeS5QcS4ZIn8mWFv/6Ng2DPgo3VafBA3CoB4Usc4wAVGfmwsj9G67dJ
         RZvL98sM1KoQFm9PIdePInxG0zqB4dUsloyW8pdo0etaxPVqFKJjP/TnpRMVOoCy28kF
         yi2JV9gqne2CFHTlAiPu3TNWaSUtLLAQeyURx33qMQ9vRv2QnpXGbi8iswagiXUztQby
         93DQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766879643; x=1767484443;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=0vAJYJFTVTvQKublqQlzRcmbWps7nPfytE/7e/IWl6M=;
        b=hLjgmDESjlgAzl00ZLT87A5LS7ZHlqslaOY3D5D1mzrf/XYpwJdKvPJQ+9x9iZDndw
         5kc0Qdi/gnCoInyw/vy8RV4LhGJ5PmNH45dFR3xoF+iCUD13U5bet5dCrifsEwZslJmF
         y3Y0rzNWdKjj50PE0N4bn2kSNd9bciHkzEQURxR2sDy80F8+m1LiQCzqvyCeEWrTrvua
         6sr98lpLAG6FiFalSrky7ZZaBcXh0zULqIsW0hgj+8FLvE8uM20DxMNNudkXMxmcSai2
         4jn8HADJqhygLlifWaCk0W4MsMMSG9VIywCviWW1bRLDkylLga3Fh2eVTwkyqKsRli/Q
         GWbQ==
X-Forwarded-Encrypted: i=1; AJvYcCW2w/4zbHbt3m39IMzSdsgBp4V9f49szxTHJ5tX8cus4gxc+oNxawK62y/KklvloPHvmwUFh7+/Rg==@lists.linux.dev
X-Gm-Message-State: AOJu0YwzKDhN76wqZOC/s/nu4kpFNgttbNYMu4SBnV751GYZFrIbmF/0
	IQQkiARR9urh/yfh8RU5lCkez/iCOyLVMQkZJmAIqtpVT2xDvMnZBJDWYVMo7vZnG7qFVVQnaYo
	ZyaKn3lFr8E/jLwnZeNbEh3gx9nyZIb6ydo8yXikVPA==
X-Gm-Gg: AY/fxX6YEOTFbOd9E8aWR8ewfn91vk7dNeEACwDjLsraO4Ys8bxJBdG8N5XLJkYn9h2
	lOniMA18Roh6eu+bMW5jU4qGlWZsS01Yzq0xCqUfimZNWQsE1iK31+QJiRc48ObsljFKLAVn/xT
	idEI58OHzFEJ/lsqGdUP087H2i0A6ZpkmtVFzixM6hBCQUd8/m0bM7FTIcglr+4hhm/jEC60Mf2
	YKF2RaKJI5pUbdAZBKp6+TKdo3/UHxLGKbYs7xs34MXUS7ADoCiSg/v1GoxjwMvI8zTQ5uGmBej
	1RiBPWCo6SjPRRMEtVby9MHOtInqdnfNJrUeuSlS0cdylyi2zrnxROU=
X-Google-Smtp-Source: AGHT+IEhv1iwMFNgzL2n1D3qxYmYFnznNjZn/Bh2THNz0qVQWcHa3YNmsM1U54RXexGunoARNUdRYz2jyJk3Os5ODmY=
X-Received: by 2002:a05:690c:610b:b0:78a:6e23:2542 with SMTP id
 00721157ae682-78fb400dcfdmr218117857b3.35.1766879643443; Sat, 27 Dec 2025
 15:54:03 -0800 (PST)
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20251219-i2c-reset-v2-0-ad201a602e74@gmail.com> <604e5781-5c59-422f-9c5a-ee4be6f8b329@kernel.org>
In-Reply-To: <604e5781-5c59-422f-9c5a-ee4be6f8b329@kernel.org>
From: Guodong Xu <guodong@riscstar.com>
Date: Sun, 28 Dec 2025 07:53:52 +0800
X-Gm-Features: AQt7F2qc20ZUjd9UnVS-1ZbeNfksHFtdnbsOaXZ8RFpk1tbDmXxCOs-6B3ZEmyE
Message-ID: <CAH1PCMag00z2Fp8zjMUPS7AdU6Lgk0UsS+mku93NtNejqjyBMg@mail.gmail.com>
Subject: Re: [PATCH v2 0/3] i2c: spacemit: add reset support
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Encrow Thorne <jyc0019@gmail.com>, Troy Mitchell <troy.mitchell@linux.spacemit.com>, 
	Andi Shyti <andi.shyti@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Yixun Lan <dlan@gentoo.org>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Paul Walmsley <pjw@kernel.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, Troy Mitchell <troymitchell988@gmail.com>, linux-i2c@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-riscv@lists.infradead.org, 
	spacemit@lists.linux.dev, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Dec 19, 2025 at 4:03=E2=80=AFPM Krzysztof Kozlowski <krzk@kernel.or=
g> wrote:
>
> On 19/12/2025 08:42, Encrow Thorne wrote:
> > Add reset support for the K1 I2C driver. A reset ensures that the
> > controller starts in a clean and known state.
> >
> > Reset ensures that the I2C hardware is in a clean state. We cannot assu=
me
> > that no program used I2C before the kernel booted.
> >
> > Signed-off-by: Encrow Thorne <jyc0019@gmail.com>
> > ---
> > Changes in v2:
> > - Replace reset property in dt-bindings.
>
> Replace with what? I don't see anything else there - you still have
> reset property.

It looks like a phrasing issue. By 'replace,' I guess, Encrow meant that
the resets property was moved (reordered, put into a different 'place')
within the file, not that it was swapped for a different property.

Encow,

Would you please correct your changelog description
in the next version with something like
'Reorder the placement of the resets property in the dt-binding file.'

BR,
Guodong

>
>
> Best regards,
> Krzysztof
