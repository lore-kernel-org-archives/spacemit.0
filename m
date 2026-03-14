Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 837BB29D29F
	for <spacemit@lists.linux.dev>; Sat, 14 Mar 2026 08:20:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.46
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773476444; cv=pass; b=P7NPcuaxvRZ23pmaxMX7Xz9m8mTD3b7OCFOOtvzKivU6i35jYTuNbSzeGYmbWWcqI9SS4z14wmVesHGN2RTc6j3okRjlfiC5YgXn1PtwRrniwdtgGRa2Sc0GeBKMdnRvbofaBUN9V0RE7bkA+bHaAW0JkQlCCkMP4PNDWY1JJKQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773476444; c=relaxed/simple;
	bh=aKEodoFrsnEUz7A+3wp4L6Xznh2GG5VgXnuRS4O4LBk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=eagvSkE1KR5GbnuKsFW8JKhcVu+fqtttUYQfQFaKTJCMnRKSHbYx1Z45g8nblYJrizSAktcXUP/Szn2mSlK1Z8rmRRWkgVo2QKmrzV+2BuWm/Pfa6BdkSN1/+80n0nViaMHCwwNvYHRujFiEjQWD6oXAadki4ER57j85M3btoI0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AtwtKoqp; arc=pass smtp.client-ip=209.85.218.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AtwtKoqp"
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-b96dc65b886so724315566b.0
        for <spacemit@lists.linux.dev>; Sat, 14 Mar 2026 01:20:43 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773476442; cv=none;
        d=google.com; s=arc-20240605;
        b=i8wUsKvauPg9BqwWrC0Dv7+zewt8WG6W71XS6w7GmUQHvHsbN+I938y1YiBEwzQ6jS
         /UPlErCsmXXkvrNKr/qudmZDMM5dNHD2jM2XfgjmG4fNJqhqjwrZoylZpVkxm1PPKHkA
         ABNhX59FqrHpXpNKz5KEf8i0/Oh3EOgdWTRJZvCL1WBKkvoDWN8B/egtuHJFgAGnLaoF
         Nrnk/ogDrHt+YO95PxYOz95m5qrGWDxJU4R0Wl5NW9ZiI5ZLt56eUPz7N02rGYyHi1Sx
         ji7TNFPhS+FJvEt5Z22TRh4aqleEY1rTqaQpngxlbFEs9TcJhP/Q9wUvbJWBKLRTU3VZ
         n9Dw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=aKEodoFrsnEUz7A+3wp4L6Xznh2GG5VgXnuRS4O4LBk=;
        fh=gHV6bSZyxWXt8K48FYzTNkwo6A806ldAlr6UrNH1Ozw=;
        b=QrlHBew985JQ/mgidbpTjFFRHjlWwJsxAOEWR/pahc3eD14ZJF3ItgaYmoqFNkAsKr
         WXBQdZz2YMqtD3KGi0n27mIAPNQS75lnAtkLi4ujvE1uA8c8numX+UWJs6xq8VHGI/Qa
         5NuCzWd7B3i6l4aagG0eDqF60ZTeCVuuusS/TEagCr14Hbop98YShyf0duGjWfAsYJ6U
         Pd+/lbrwh2XjvCMCruWtS4uRg5cCm/pJc0CsBdhIjWrSEbk1wlC7wigd3XoD7JMlX+1j
         ok37BCxP7zz1c39Qyw8Uf2xq/ThaxhekbYEFMNTC3S5IL4a/hhBUYx+Qgwy7hfmNnwIu
         2/ig==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773476442; x=1774081242; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=aKEodoFrsnEUz7A+3wp4L6Xznh2GG5VgXnuRS4O4LBk=;
        b=AtwtKoqp+1j3/4YayEbC/KruZudBlgfXGsciXwBaawCyicrpEBZxUSp6FbU/rKCK5W
         tgfwsFlIIsF54UrbToYX0/PkPAtdxTWErdod25mz9c3gUbp0uuuthkhxJARKDEXIJVce
         AAe+JCBzzQw6qk+xxOiRayEs6zbrn+ZgnkT/Nriq6aMzOHBPFSjHhHtGG7sIIgbaMRIY
         Ig0PHUdBiIhPb+6bENbl+Ch3n325Rnl0tCZV886ND9nTTJEpMw4KI0TNDowcDNk8r7T9
         YLNAURNwPwDyQ3x1NI31JFVl71sG+JZANTPbqjGL5EwpxCF2bDfVwZaErihqF+Yrvvvh
         J1WA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773476442; x=1774081242;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aKEodoFrsnEUz7A+3wp4L6Xznh2GG5VgXnuRS4O4LBk=;
        b=AQkATHwzSp+X1sI8nYATpYbl6WVECQ0oYouzXdfrGzOEFkE/z02Z5mPU4jxgIiCHlw
         N6s+CCkNcnxYSF6KZSgO/8wUUU55QJBBo/CKrGTaKNMmDqcen45TnSUDCFyMX72vx2uo
         prT+a3I5OJjfGnvNPBxmBD8A5iJpTF3vktUiUICRaIaWbmyLT2vy6xua0a6Zeqf0zfs8
         rJRVjSFXmubmrv39el8c0VFZU6K8JexWKQBlgKHrR3jpfSBtQS2Z6IOEWBJbrj/9itbg
         yffM2aZIF5XHYU1GDafDW2v2GDvJNgAlnhE9lqDiBVr2El5RhVcBwva+ldyq3oPY/saC
         x8qw==
X-Forwarded-Encrypted: i=1; AJvYcCVMpo7rnVJNxsxh+1F9LQpeZyD0nHiyBNwvLqRISAtku/9GtPSfACwLVXqrgy36gwwweJuA5/FCOQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YwZVhAIYw0BFFCNnsWbaST9vkJ8Sc3c9cAMQnAF/BkPa4ej0Kiw
	rj+PbChYCxZZzAgsnHejx5W4CeQnF9JUImPnFOBfI8kIOSc1Dk2thdIpxZWfrrrmTgNmik3kpeg
	p00s9iMNLMC0pOph/S0YESH0vCJfy9OQ=
X-Gm-Gg: ATEYQzxQ2eQAisWUjYEn2wHqgFyUmQ1RukOsu1vu6km6PA9kMYBq1qdQk6nFJ2SPyVc
	e6H+npi8QUyCc6fhTSUAAEoTpAG5tXAH4kBhTHNpnNY5neQavi5zp7KdVaHChloQfq8az4OwJyP
	wi6PFFDJql2OOdu7rKWRMMlxS7n2nGsNGzyUKqafo2kk218GCYTEuczrjKFN4F4pyl38RtmEP9M
	D4Q2AsOcdcnW/PlAJ3KG7B988S7s4w5lXstKp2UlZRsJ+EPpSYrWxvTm/ADgY82s42Cl/EremIa
	pqbV4g==
X-Received: by 2002:a17:906:dc94:b0:b97:80be:c9a0 with SMTP id
 a640c23a62f3a-b9780bf0140mr178652466b.28.1773476441488; Sat, 14 Mar 2026
 01:20:41 -0700 (PDT)
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260312-k1-gpio-set-config-v1-0-8c3541da16b1@pigmoral.tech> <20260312-k1-gpio-set-config-v1-1-8c3541da16b1@pigmoral.tech>
In-Reply-To: <20260312-k1-gpio-set-config-v1-1-8c3541da16b1@pigmoral.tech>
From: Anand Moon <linux.amoon@gmail.com>
Date: Sat, 14 Mar 2026 13:50:25 +0530
X-Gm-Features: AaiRm53rSdWgcmbPnwhHtOT4QoH5qCsuKsNqkPJOpNSMw1Ld03rj8Uh5faUWLZI
Message-ID: <CANAwSgSreMvKmWuV-wikoiEQDGEQ4YCo3MN8Ke4s4+Y49OOY2Q@mail.gmail.com>
Subject: Re: [PATCH 1/2] pinctrl: spacemit: return -ENOTSUPP for unsupported
 pin configurations
To: Junhui Liu <junhui.liu@pigmoral.tech>
Cc: Linus Walleij <linusw@kernel.org>, Yixun Lan <dlan@kernel.org>, 
	Bartosz Golaszewski <brgl@kernel.org>, linux-gpio@vger.kernel.org, 
	linux-riscv@lists.infradead.org, spacemit@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Junhui,

On Thu, 12 Mar 2026 at 14:14, Junhui Liu <junhui.liu@pigmoral.tech> wrote:
>
> Return -ENOTSUPP instead of -EINVAL when encountering unsupported pin
> configuration parameters. This is more logical and allows the GPIO
> subsystem to gracefully handle unsupported parameters via functions like
> gpio_set_config_with_argument_optional(), which specifically ignores
> -ENOTSUPP but treats others as failure.
>
> Signed-off-by: Junhui Liu <junhui.liu@pigmoral.tech>
> ---
Reviewed-by: Anand Moon <linux.amoon@gmail.com>

Thanks
-Anand
