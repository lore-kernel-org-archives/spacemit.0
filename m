Received: from mail-yw1-f171.google.com (mail-yw1-f171.google.com [209.85.128.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7FCA91FC8
	for <spacemit@lists.linux.dev>; Thu, 25 Dec 2025 23:38:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766705916; cv=none; b=GFPwQ0wJD7232I9BLWhAbFhP5Jc9rMO+ZkHV5JsaMhe/2sIlURy2vgHoowqML9pIoxxATgBAOT81pjfcY3oZIveY36BrH9l3yBhhQRDcF/+GUWrF6QBXhOc/IXUXVCStfLTghpsjaYZEo0XlMKarhJoP1Ci79WmAzBU7LmhQysU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766705916; c=relaxed/simple;
	bh=6zP0IiflYyQSASWEEFsBwCauqhKF6QYxOO+2s05ZiBo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=RDVU3G2c7uW0Rso0/ZixL95o1xRmE2JVwIoq9/gxhs9PpPdRkoFFWvG2/ttfr3ZSB7PGzj2KfAFyhIr++mlJFyi6/A4F+b2qH0YVUvrwKt7roI9v66iUm7IGiIVANJVJQKN1Wqx9dFsH/CjWlbsc5hhmvkxwBHw7+pEyobGE1Ow=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b=vO1gFY5K; arc=none smtp.client-ip=209.85.128.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b="vO1gFY5K"
Received: by mail-yw1-f171.google.com with SMTP id 00721157ae682-78ab03c30ceso57715117b3.2
        for <spacemit@lists.linux.dev>; Thu, 25 Dec 2025 15:38:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1766705913; x=1767310713; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZtwWuXybhT2W9TxRXdZy0Vcd5dnmb9iqNRTDjEbh5tI=;
        b=vO1gFY5KJ9DfKKJySQKkSfiDQr5U67kyPeuSbReMF/pHzWY1ivZfq4f1HLn/7ceSex
         rgTuxrc+xWMZEHiMxUq+CIPSu+SvrkfFzfHnjzH7Fyc1PlvH6wsufC6F1tE7qdKNpWZX
         z97h+/p+Rq3s/Vsx7CTHS0+LLdKk144oW6VRz8jzFAqWA8FBW3viAf/D2Yq7gRL7Pv5u
         xJOYzcP1Bj8tS74UMtcemHLgetZv+POGvy7/RqRU0SJVybdMgt4dZLew5kXerB9Y5weV
         9cxU0cb71U5uz3MErMZs91uqsH7GqiR1nmyWn1K9/cOhIKEjsge+6VHh9j7IOFWx16zZ
         tImg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766705913; x=1767310713;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ZtwWuXybhT2W9TxRXdZy0Vcd5dnmb9iqNRTDjEbh5tI=;
        b=mkOxxwiBxTKh2448iM9ZC3IuK+o8tmyUdnMq9kC6QEqOea6N2gbmcMa7m7/oVrEDbY
         qovqnKA/xTpaT+P7179sWG+MtJPVauGlGa/KKb45xHMoyFApHsRQk4BrdJpzuwOFdAJB
         3nVbJxK3dt6EYIqL6RRilmJMnPfLjQSzIicZUiJW21RvTlkevoQlTLnl8OC4rexX5W0y
         G4jKI0LqLHpUUDUu0BHn3GE665uNarQjE8wRCkAJkFM45d8jV6nygf9DFWwH/9Jyo0m6
         U9CYqWhjmS2ag39a34QcjSdY9pmvGIPZwxxqGsm4nPprAWHY0DARa0JRR3LM81S6mRIJ
         sAtg==
X-Forwarded-Encrypted: i=1; AJvYcCWLsWgLLOQABcNkWAY79JfPiXlqSwmcR+XQWzmlxHYpG+YskBJqB49C1EmFEDsJiPGc57keYCbTJA==@lists.linux.dev
X-Gm-Message-State: AOJu0Yy1erYvBJaV22meLF+cPPrREOpkN8THkndyLJJ6bgnT+obzazSI
	C93oCXKG//ekSqwcpgy03ZSK/RV5HlutPg8aJSfWLz0XwblX6FGx7hIXRvim2OJwggNSVF704Zb
	Cegm1ZKxYlnHXS7aRbHsxqnjFIRts1nIrbwh55AinXA==
X-Gm-Gg: AY/fxX6i3IoE2Ig785DLity2I3pe5//fgXIw2rOAij/DuoNdNM+HxyjWzpBtMT6ckI+
	K8pDRyhz2AcyUIsL1MEGMzUy1AjMyCeKmpER9RiShLlUU0/QhAF1IBasbH94xVTjfDTj6WT0jEB
	57pTMnoNpaaOWHdEVMW8qnt3GIorqM0gIb/8KphDOMGqdWPwTrXepugLtQ5eEE6fuQsSjzfbtD2
	5lYk2/LurBUTxaK+xVuYml1pNQyX4G/l7wWVEUY64fB1wc+Iy+SJZ3cKIpH6KyQEQJPJg1sJ66K
	5UC3Hz2nofUVD6zKR5DpyQ7mcQkNS5MxV079iVrd
X-Google-Smtp-Source: AGHT+IEqsYbbjwXLehn9TCJIOLfPJOIm/LDNAeoiYZx4u6S31/Kpcix2Mq3YrFQJu4uTOl2wq4xpYsyoxIEJ6tMxyHM=
X-Received: by 2002:a05:690e:1517:b0:645:5811:fb30 with SMTP id
 956f58d0204a3-6466a843f55mr16899140d50.11.1766705913510; Thu, 25 Dec 2025
 15:38:33 -0800 (PST)
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20251219-i2c-reset-v2-0-ad201a602e74@gmail.com>
 <20251219-i2c-reset-v2-2-ad201a602e74@gmail.com> <2dmrli7yzznpurg74wet4oidhljjf3csdjly2dwpyvyndhrec3@uc6ke7mep6fv>
In-Reply-To: <2dmrli7yzznpurg74wet4oidhljjf3csdjly2dwpyvyndhrec3@uc6ke7mep6fv>
From: Guodong Xu <guodong@riscstar.com>
Date: Fri, 26 Dec 2025 07:38:22 +0800
X-Gm-Features: AQt7F2psMc2LHbqeHhwPYOjN4t7xqZys30Ti3iWo_ZH1lUjqY_uTazP9ZogzLZM
Message-ID: <CAH1PCMbGbe6MQtAucf-4W+H_G0LrvPNGyaB_OUyxqf5TF=jixg@mail.gmail.com>
Subject: Re: [PATCH v2 2/3] i2c: k1: add reset support
To: Andi Shyti <andi.shyti@kernel.org>
Cc: Encrow Thorne <jyc0019@gmail.com>, Troy Mitchell <troy.mitchell@linux.spacemit.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Yixun Lan <dlan@gentoo.org>, Philipp Zabel <p.zabel@pengutronix.de>, Paul Walmsley <pjw@kernel.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, Troy Mitchell <troymitchell988@gmail.com>, linux-i2c@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-riscv@lists.infradead.org, 
	spacemit@lists.linux.dev, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi, Andi

On Fri, Dec 26, 2025 at 5:01=E2=80=AFAM Andi Shyti <andi.shyti@kernel.org> =
wrote:
>
> Hi Encrow,
>
> ...
>
> > +     rst =3D devm_reset_control_get_optional_exclusive_deasserted(dev,=
 NULL);
> > +     if (IS_ERR(rst))
> > +             return dev_err_probe(dev, PTR_ERR(rst),
> > +                                  "failed to acquire deasserted reset\=
n");
>
> If this is optional, why are we returning with error?
>

According to include/linux/reset.h, if the requested reset is not
specified in the device tree, this function returns NULL instead of
an error. Therefore, IS_ERR(rst) will only be true for actual
errors (e.g probe deferral).

BR,
Guodong

> Thanks,
> Andi
