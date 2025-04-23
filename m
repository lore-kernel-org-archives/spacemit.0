Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49B9C1E0DE3
	for <spacemit@lists.linux.dev>; Wed, 23 Apr 2025 08:39:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745397581; cv=none; b=Snnq0PPjEW+ws6+4QdjPGG9V9gwGCp0WbKuNm8qjFR/bZP6Pd+4Zcjn9Z3D6OS7E1ms2a6hOgcVmfDSAFXBrMb3OhuzEaxGqAA4KJyFT7QlH+YFigequvr3pqGVrhXzZhWdc3bwqid26XUkXvofygGfVRMoQ1HRne+p1g52b5qU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745397581; c=relaxed/simple;
	bh=grgPkLeDaak7FHXRcZ5Lz333Opab1u40+CL8LBRoWz4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=lD2RzYroUuMqmD6BGK+1p7GnMgDfNX/BLM/LgotWypp4z3+SwiS1JUUqnsCfOyRSmnof1El/YITTa0zvqcDCPqWo0fyKa24UEilB5H1aOJws1BBbFC0qF7xK7IuAWDAMhLXF/UTtknHrh07NcuFyOJ3vsdelmCaEsuFyn9QJhDg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=J6OqQVgB; arc=none smtp.client-ip=209.85.167.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="J6OqQVgB"
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-54298ec925bso8984390e87.3
        for <spacemit@lists.linux.dev>; Wed, 23 Apr 2025 01:39:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1745397577; x=1746002377; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=grgPkLeDaak7FHXRcZ5Lz333Opab1u40+CL8LBRoWz4=;
        b=J6OqQVgBiYui+CMKQudWIxtDDxRP+lAEKBTcSWPhaY7XbU50Ngx4MWjvg9uNoFYCN6
         TK7mTJ5lz9i9sjKNJbiqxf/jksKu8URulN4JPgYk9Q8hWLAdYe3ziaCUfTe36j5DN5Td
         ZPvnxHg7AJxLGSgpVtRklu3K3TRJH4mJ3iJV0PdOgquuP8JpLGUyZC2xowGlDQ/kAHvi
         vkdeQDvTNjxMt09/WSWgffyyghj7rPQF+PUJieANPzMinhmOLa6PAgey7XxvQ2A+op2S
         bv+Kr5CVzg7XBVNoCnN+d9iFyW4HNkgh815V0nxqzLnPSRQetjUas42ASUhHMJ0+dMYq
         ZCeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745397577; x=1746002377;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=grgPkLeDaak7FHXRcZ5Lz333Opab1u40+CL8LBRoWz4=;
        b=d4eztSE/Y7UV2SbyeflcL4UKV9gEzkzwFgNRxEUW8fx0j+TNSVGS3FOOkmTwmvE1ru
         EtNjcXSUWCeHjNFuqlNiLfdWtsczoTaolMOe23F5fyEpCnMX3c3NVeqyJc79lxV/puLS
         a9E3QZN6m3Xo9+dW9rFs0m5KWqbp+Tji54gKh+ScqX6QplNrlTSZz0Motd7W6JYXHnUc
         yfQvyAwbHBDdYqbG48I06CjwaefFRqt4AqN3V/4AEDW2qURx6CxD2oO01BlWuK23B+4j
         iS9U3bSd+EVIJJc2qqsZwozIO/niTr2Im5r5zll53F/WNaZVCeqWrBZPwxKfd1hOk47k
         /sfA==
X-Forwarded-Encrypted: i=1; AJvYcCXZCQDppSvah6wayjakPsu4lTCYKxm396aAHISIh5UtI3HuVEGVg1Gl1wlYmXZCoXFoDZTFiTOAhA==@lists.linux.dev
X-Gm-Message-State: AOJu0YzROCt/Zx3Qx5EbL/sLBpjKbA/LiHHjYrTF8EWYz8W8ev9JMsxo
	QVSqyJF+iYFCrXGB2lLCgz0nOEhgzJU74/jCsZW8jXFo8etEAt5TWC5Ad21Z6CtqMZzKAdULdlo
	8GngOMbdYBZeUIkWVh9d3wgX0511V4LfWy4CujA==
X-Gm-Gg: ASbGnctQ7M7T0lA/rRUXzEdbDUCSCmHzaYApXTLpnj+XBbez49mK8G6dTsIwX6fjlSF
	aXAi+eutTq1ASYQgOUZKO9LkBzr8+QuzBs4N1Qa9X42FYzI+6NC1AKlhcwZcqWJaw0huAqxVFPf
	uRW7f3wHuSVq8LmLjYKqVOIA==
X-Google-Smtp-Source: AGHT+IFZTOoQ/SIoYXTZQ5HrYq6ViTZKpu7Uh98dkIsdaRSVIhl5RakX+3hvzmtcTmlbY+w9Vf4quwvNHMW9rpoPCBY=
X-Received: by 2002:a05:6512:3d8f:b0:54b:f10:fe46 with SMTP id
 2adb3069b0e04-54d6e633c8cmr4512868e87.25.1745397577343; Wed, 23 Apr 2025
 01:39:37 -0700 (PDT)
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250416-02-k1-pinctrl-clk-v2-0-2b5fcbd4183c@gentoo.org>
In-Reply-To: <20250416-02-k1-pinctrl-clk-v2-0-2b5fcbd4183c@gentoo.org>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 23 Apr 2025 10:39:25 +0200
X-Gm-Features: ATxdqUHd2AvWX21KS5yncubJtaT0PJGEz4DTRXuWL1cWY2BMp_E6mT4BPCkdw64
Message-ID: <CACRpkdZpHHvbu41xkK2n8-Hzf0euU14T6F42hXLsM277LJA29g@mail.gmail.com>
Subject: Re: [PATCH v2 0/2] pinctrl: spacemit: add clock/reset support
To: Yixun Lan <dlan@gentoo.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, linux-gpio@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-riscv@lists.infradead.org, 
	spacemit@lists.linux.dev, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 16, 2025 at 2:15=E2=80=AFAM Yixun Lan <dlan@gentoo.org> wrote:

> SpacemiT K1 pinctrl requires two clocks in order to be functional,
> also one reset line from hardware persepective.
>
> In this series, adding clock property in dt-binding, and activate
> them in the driver. But for reset, making it optional for now.
>
> For DT part patch, I plan to submit after clock driver merged.
> This may result dtb warnings in this version due to the mising
> clock property in pinctrl dt node.
>
> Signed-off-by: Yixun Lan <dlan@gentoo.org>

Patches applied!

Yours,
Linus Walleij
