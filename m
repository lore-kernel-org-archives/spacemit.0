Received: from mail-lj1-f174.google.com (mail-lj1-f174.google.com [209.85.208.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FCFC26C391
	for <spacemit@lists.linux.dev>; Thu,  4 Sep 2025 19:35:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757014543; cv=none; b=ZIYAsVeCCgZit/MQc18x07Hg9xZk9dumeLvH96gegRw2HkXK+s2KQfF6KXm7jyGI5EA2Dzz9qkV/mIJXPS3/9c5Z/D28KYbu81iEVXhOM4VdnpdKxgxYUiryFrsWoBASQOo46HdW22sd2wuIzEkVN+7Aa/ELFUGImZ3YY5S7wHk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757014543; c=relaxed/simple;
	bh=32nYEhO3U0uVRAxCwAscIZa3xyyyN4IzR3cTBfcZ/4s=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=aywn75A0q+RB8fL3/JhPagw1vQqGUF5fn/d8r9+E6mKyM68ftRpqC77eZUOi4FE2c2YyDx/QSweHG6hdcYhqigfi2poC4i2zA90GOBBAithFwhtA4+8sVdfADCblPv0Ty797BJ7x0ViindgtWxZq06mdkQsLu+Lic6tw+MFT0+w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Qij99O5V; arc=none smtp.client-ip=209.85.208.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Qij99O5V"
Received: by mail-lj1-f174.google.com with SMTP id 38308e7fff4ca-336b071e806so12950381fa.1
        for <spacemit@lists.linux.dev>; Thu, 04 Sep 2025 12:35:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1757014539; x=1757619339; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=32nYEhO3U0uVRAxCwAscIZa3xyyyN4IzR3cTBfcZ/4s=;
        b=Qij99O5VnS1OVFtQaqNo/vWXZ6J1vdccB2s8DUv1O9Uwf81tSSn3YkF9k8HnCpJKF5
         BIAUhJX2EnIsLgTjyBWqrOK8FjNSI8ke/Xw/ruOxNmQjgdP3VZA6YS6eAnu1pqB7ZeIf
         GHJUXQ7y6tv3XCX3PCTyO6WVUzwFGugsoK0cK68udoDlAkzCY+PZG5VfQBKAWZWM4e3c
         VMAn60FvnEsolqTaYz8cA2TNNzI0+sQOYbtqy+juRrXPcgIZzH4FezeWIoz6XjhaIErc
         BaVW4kpHmikofh2Cwu1ql8GWDt1rAgOVd9jZZzK3DHj91Gk1Fb1Pw2W2PHRTcdA5+D3o
         xOgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757014539; x=1757619339;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=32nYEhO3U0uVRAxCwAscIZa3xyyyN4IzR3cTBfcZ/4s=;
        b=mJFtCKE1NEAbWm1TmqeiGV+EuhGqXx7qJQZCIw6ihqbkeKQnase6LiTNKUPi9jLwXX
         60xl4/HefLeQ1L2J1IOR+PEgxLLxRP6DJ1qgiOOXwRrb6wyKl7WAReQKk2wj4KlF7EYv
         U0Q6QjQLHu6CshXdeahiFLiN5Git6tOfoIS2utpuGaWOAOSm+DJqNL/wye2ZjJveyjIx
         Gs6NFbiZFNY65YiW597tho3Wp9zg80In8+4lBlGtHYu8nNCvqA1LDaDccIkWQ46uOikn
         XqwpQGHXpssgzq5bL+lZCq5cqoTZW3Rsa9fo1t/kcC0VqmIXMJtZNq8ZBhjQfMjEUdJr
         wM5w==
X-Forwarded-Encrypted: i=1; AJvYcCXoJgd83Fj74pm3l4GFzNLvv67itvoj4jxckWB0qDtFGWLapFwX6RogZ1BDEY2GlG9sBWYTRGiKbA==@lists.linux.dev
X-Gm-Message-State: AOJu0YyzB74odvC0/fDl2JNgSFGlPPyEK2+iPqTT6NJGjexJ6B7hrGAu
	u4VaZWDssGnrK5qAdCCrrKDIOX8nvXkc7Uh4ZhZY6x0H/Ikt+zeGKhY5qu4iuCDxmjOUf9g0DhV
	szUt8M24uxzEeACYqPdh37+B6dblcPqL2Y4sjKmioCg==
X-Gm-Gg: ASbGncuhF72O07ge8mtcOs2Nmt6s+kYNjgD95ozmMS22AdW+Kiq0oy2kTZTUPfh5grf
	VIWFb2+nEPk+LhmATFiXCHEHgkpL0DpMY8Q4BloVOaNYAAuZl2kZzrtk9U8G/IF7TG2W4iVac2E
	yytiQ0KLwBAt+N42a0pFQ59Mx0/Pc+gYwr/ahfQXyBnMGK9BB1FT/qfc6IF5Kh4TL1jjrJpHFno
	xT+BB0WYfNGG7W3pA==
X-Google-Smtp-Source: AGHT+IFk6qWrCgBCMUMmRXmwNfVdMojmRglmfhyiJ5psNymemT9FqXab1r+PbaMVvluse9Mju6Gt2tnrWCGHPJdZfDY=
X-Received: by 2002:a05:651c:1079:b0:332:3fd0:15fb with SMTP id
 38308e7fff4ca-336ca5c1a70mr38397421fa.0.1757014539436; Thu, 04 Sep 2025
 12:35:39 -0700 (PDT)
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250903100104.360637-1-hendrik.hamerlinck@hammernet.be>
In-Reply-To: <20250903100104.360637-1-hendrik.hamerlinck@hammernet.be>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Thu, 4 Sep 2025 21:35:28 +0200
X-Gm-Features: Ac12FXwi4fLng12UMi28VuiL73WI6CiLUWCY-CJjaRNMNpJieZixpye9Zb1GrH8
Message-ID: <CACRpkdYMHMvFCzcA0G9sj+xSrjXROU4OmnV=x0EPfRBpVycQtg@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: spacemit: fix typo in PRI_TDI pin name
To: Hendrik Hamerlinck <hendrik.hamerlinck@hammernet.be>
Cc: dlan@gentoo.org, skhan@linuxfoundation.org, 
	linux-kernel-mentees@lists.linux.dev, linux-gpio@vger.kernel.org, 
	linux-riscv@lists.infradead.org, spacemit@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 3, 2025 at 12:01=E2=80=AFPM Hendrik Hamerlinck
<hendrik.hamerlinck@hammernet.be> wrote:

> The datasheet lists this signal as PRI_TDI, not PRI_DTI.
> Fix the pin name to match the documentation and JTAG naming
> convention (TDI =3D Test Data In).
>
> Signed-off-by: Hendrik Hamerlinck <hendrik.hamerlinck@hammernet.be>

Patch applied!

Yours,
Linus Walleij
