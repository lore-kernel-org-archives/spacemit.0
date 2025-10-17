Received: from mail-yw1-f169.google.com (mail-yw1-f169.google.com [209.85.128.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C2EF336EEA
	for <spacemit@lists.linux.dev>; Fri, 17 Oct 2025 15:33:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760715224; cv=none; b=MzBN8pGZJBRvrFxuQIuqLC0d7CdlmfAemW34OId5CFDodzERx+JII76gr5u6mn0fz9HNOJzIkqtIro0DJVwU+o7qf6pZ0EgYUr26p9/lm+MfBlmADDzj47mJkGD2sGLMZmWXgAM+/7ZwVhnjMJD1HGCD8HFTkgA0dA47Tmyx14U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760715224; c=relaxed/simple;
	bh=AYDyBoqSGxp3sLQaIrRnQxkp9h8SmM+W9ExXpNQDIpQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=AXweFqksuqIGWtm2o3qJYqN7kSd2MAEo5K3bDE8Z/twN5Ow1PG7eXduwxaEhONDIEV1AtBDoP5OiM3LN2U8FGhuc5HaDQgaUBv2QsFYwgLfB/ftLbAMOhKNQAqiKw18tWDw+/gXjxveGiIqyDzvrkK3gWX8TOeqXoWbZphGCiCE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=eXkjqWgP; arc=none smtp.client-ip=209.85.128.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eXkjqWgP"
Received: by mail-yw1-f169.google.com with SMTP id 00721157ae682-71d60157747so22370487b3.0
        for <spacemit@lists.linux.dev>; Fri, 17 Oct 2025 08:33:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760715221; x=1761320021; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=AYDyBoqSGxp3sLQaIrRnQxkp9h8SmM+W9ExXpNQDIpQ=;
        b=eXkjqWgPXuNxP9bwLKrUv/yhwh2Vx82ehJdR0MeKCKiQedSjtnsLd9no4HwjUmu5DY
         yYC1gMvWVmp4KPr0VlJe3Yr6bxAFB2c3kdh/V45VVGAGuQ3p9bxaVqydXWOY61njwrPc
         bRq8JGpRuqcCnKUnrrHzzMkE991TLvDzE8TU7Hk2Z7BRmXSCsxFXz5EK6vSCPWvU+F6P
         gOZ30QeBhGkdLQWqt9KjiXyfdcJ+y0y17Rm7lUV1lHeYB0y4bJhaJkdqgpAg0QtFzlYw
         yCh49Za3BDYwvGeHwmf5lKPycNnkKdTkrLJlTFs+tOjNGunutT1TtkJMeMsYsde/cbCt
         qtuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760715221; x=1761320021;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=AYDyBoqSGxp3sLQaIrRnQxkp9h8SmM+W9ExXpNQDIpQ=;
        b=YCoDYF2oZ/dQw9DbkiJzo7tbbRPYuWeA1IkVlgrvmTd+GUSkx0MjWsQYvliP9FLNCs
         e4kjhsL5pYfKPhFeERnuQBb3JIT+tQSlaEdcNASTckBB23zjeGUQKd4Xf4FUhnIFPbcU
         8zDqIR/y7eRISfX9go3q/7f/1SNbvkzMoH+Cq5yFg2mfprdRpXL+IKfXRSLGSmfiFURq
         Ynd3xEB/Vp+c0WnqBIimO6R9cTYbpbzrOOcjR1Ar0lAEpFqTqwKwBHeYJEyKJBwDZR8c
         MIfTJDrzLTuIsz5i35B+qc21fVpAmi7bexzdDC61S9TKgEjNnqb79YSiTkSnjUujXIDI
         vpTg==
X-Forwarded-Encrypted: i=1; AJvYcCUodIWC9S7cF3AesNDz84kkUUi8wFKJP/2CMM04aqkhmJ0VjX22OPwHwO4Ac5sS70MJqqC3eGXZ8g==@lists.linux.dev
X-Gm-Message-State: AOJu0YzqHxjnF1t90xBTHqnIZ5mrrUm51+4+eyEKCy0tlptJwMzhbxsl
	JZXso3rx1T/YRvsZi+mC50uuhUIDI4gGPzuiHPAqZ0apWNLo7Pj++3i676JYCmXM8KjkmfxjMPJ
	C78jNcK7Xpre9OU4OM5Cyrw3ccf3HOi0=
X-Gm-Gg: ASbGncsTzNDkeDvQKwIkD4zQ6dXexcLuht79E+SzstLvUILkJYvlosecsKpivBj8FlF
	oWXwZ7TdtFeDusiHJxW0bzkpvIW93VLcladpL5K4TKq5Sw1G4IVkLQ78Q86zvAUhc+B+rNFLNmP
	qEiCxQoUDNFHA26blx26Dns5HPgzSbXQtbasM3AzirSP1Tm/ka455ZbeR6Zs1uh38gNm4ShIkJx
	pYzDs2ymnA/tkN4ZSAUjtgv7ARz0dCssV9hRwN5W9ldGuNDPSOlBwWTo40=
X-Google-Smtp-Source: AGHT+IEO4gGGrFgVxNj0joSKzwqK7reU4snr2LDuZWleqTcw0PJZE1dEBv7ao9Zj2BRol9e9zJSHmaElOFROlCzKKb4=
X-Received: by 2002:a05:690e:408e:b0:63e:17d8:d97f with SMTP id
 956f58d0204a3-63e17d8dbbamr2676488d50.34.1760715221313; Fri, 17 Oct 2025
 08:33:41 -0700 (PDT)
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20251017100106.3180482-1-michael.opdenacker@rootcommit.com> <20251017100106.3180482-3-michael.opdenacker@rootcommit.com>
In-Reply-To: <20251017100106.3180482-3-michael.opdenacker@rootcommit.com>
From: Emil Renner Berthing <emil.renner.berthing@gmail.com>
Date: Fri, 17 Oct 2025 17:33:29 +0200
X-Gm-Features: AS18NWBsu3k9OEM7-rP5g6-76bcKbcZ1KDEc8v6XA3KbUIJDEMiQsuWyEbUxtbo
Message-ID: <CANBLGcykz77U_V4CqE7PHvtgmeXiKFo0FXy-sHHiAoZ11HnCjw@mail.gmail.com>
Subject: Re: [PATCH 2/2] net: spacemit: compile k1_emac driver as built-in by default
To: michael.opdenacker@rootcommit.com
Cc: Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Yixun Lan <dlan@gentoo.org>, netdev@vger.kernel.org, linux-riscv@lists.infradead.org, 
	spacemit@lists.linux.dev, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Fri, 17 Oct 2025 at 12:03, <michael.opdenacker@rootcommit.com> wrote:
>
> From: Michael Opdenacker <michael.opdenacker@rootcommit.com>
>
> Supports booting boards on NFS filesystems, without going
> through an initramfs.

Please don't do this. If we build in every ethernet driver that might
be used to boot from NFS we'll end up with almost every driver
built-in and huge kernels. If you need this there is nothing
preventing you from building the driver in, but please don't bloat
defconfig kernels for everyone else.

/Emil
