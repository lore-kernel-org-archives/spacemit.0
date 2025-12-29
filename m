Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3D5A27703E
	for <spacemit@lists.linux.dev>; Mon, 29 Dec 2025 09:54:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767002075; cv=none; b=NCYxNqTQgXpxZeLYpfctTtI5/KGUyKDbmyc+8pcN0k9C3SWd4S4wvX+X/QxiWa7MDvjYqwf4N4ynDglrCvFsHngvHF/H4rdvMPbXhHTETRde/NB7HjUV5XcIo+L7QetRO/fXz891o+M06OUKLQyz6g8Cg+WZ7B2uic5eM0Ox/Mk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767002075; c=relaxed/simple;
	bh=iyn+7uVvVmlzVQr4OGw9gaA43U7J6DW0cM5nn14twVk=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=k3LTpssBy0zU6qoGxLbdqoY5B2VY3MQyQwiqzRA3Xhy4la3v1ZqgW6gryCIEeo0E4T632aQVBJcTDQaQOHB9ajwwpJEX7qvbiUGWkb3o+571kTfU9SQ9ly62QCWOSLJyW5CmVQyvOX3XeJxCoPHoylqof7TYEh7mw/+jruVxicI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=EqdfdfXa; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="EqdfdfXa"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1767002072;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=KSWobni4I8/LRXBXCGLU3hHGBFzvV9k0DPL4VmrN5NQ=;
	b=EqdfdfXazs9d/quMuGYRYGdmyc6c/319sbjoxrLW2aKuGly/DW/vDUjKMPBt03v7lQVv6u
	Z0l5m6wVXjXkeOBYnBWOKh0bhVSNPTpxeYVrMmVFuObEq6Z1ivuIVYfq1e6Xv/Yk5u9ApT
	at19paqsL3rmRHuanyF7niFSZCmbbIQ=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-367-LPSP9lVWMjS5HAuPZBtlDg-1; Mon, 29 Dec 2025 04:54:30 -0500
X-MC-Unique: LPSP9lVWMjS5HAuPZBtlDg-1
X-Mimecast-MFC-AGG-ID: LPSP9lVWMjS5HAuPZBtlDg_1767002069
Received: by mail-wr1-f71.google.com with SMTP id ffacd0b85a97d-430fdaba167so4773052f8f.3
        for <spacemit@lists.linux.dev>; Mon, 29 Dec 2025 01:54:30 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767002069; x=1767606869;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KSWobni4I8/LRXBXCGLU3hHGBFzvV9k0DPL4VmrN5NQ=;
        b=r1lRAqv96fG6RgdWetj69LwP447aAlxX0B2sK0A0RYCJFwZZUC7x5muZi7uKGg674M
         3o2bjN6NjKSnzW5eagWMnPKMIgqm8WI432engYmB6XhULFucy+jmVuEw2ax2B24VqYn+
         f7jUiL60cHZdTgxanuU56bPl6IPzJgf87q+yoU9YCOkVmPg9ObpfN96sEuJrwruJ9bIh
         ZC9iSuyWpqd9cSg0JKBiUggqtx1bQy44INpN+eCWXJko9yHMmd9GRghg3VNMbcQvB8H3
         luMalx9JYG/DCdXK18qbllDQGlfCvZnr7RK2Hi7kACjzlDYwFxc6gDCHNvm76WQWSYYq
         9D2A==
X-Forwarded-Encrypted: i=1; AJvYcCWQ1AH2a/XQB/nrWAH9qW7fuSX5Q2lCU6gl+702cz/MvfW2ahx74jiafuFNXhOb6YlTa52kU0n9tA==@lists.linux.dev
X-Gm-Message-State: AOJu0YzQgzyQ1A/+UOIOIg8KfWI6OuoZKlp5MCo34Md9t4VqbBHizatb
	8jtOrvd/mluwT1CYmdxM62uSDrxGox4fHPAqJPPDOkvZi0nFlwo1viS8Zu2AKdWS+0l6qOe0167
	6pxlyHF5F+PJdiiyDUPolDaVgjCV2XkEVR+ppAU2GxuCaF06XXV1R43l23hfQ
X-Gm-Gg: AY/fxX4DqcJPzGaIOWPAv+d4XvmOla9TNrPlJHUTvLZSTem5dCZ5o6pkXfzXZbiC4g5
	epjAS8fQ5uy5ryQ+lWQ6fWD1IaQjFzY6mDKNXqEg+xcaDic/47G1A9jfrGd+J1GmkesDXvCIM5b
	bxK72xEFUM/wUbHm1kyf1dMeJembJbET8s5ULTNtsUrj/u9kxNDOAtBK3MiUx3qaLB9L3Z/0vI0
	fHZQ8Gjog4M6fYwPjFbck+E/cdmO1EkxU6KgIvL0q/qiFcVbGftmiitBNZu5Rh+b4tsoWlI9Enp
	5JoOf1r/wyI1K/wKdWfKaREETEAsZBgWYe1c8Y4jNtb9MwCo94f1zg7L1DWaatP0maMLsW/Vneh
	U1+QWyj38ui7xWlWFT6gyPAc4BgwgcRKA8K7hunBKUX7v0ZlZiwl3W1XxJWT0Ep906IKm
X-Received: by 2002:a5d:5d09:0:b0:431:c60:c5ed with SMTP id ffacd0b85a97d-4324e4c1687mr36359692f8f.13.1767002069037;
        Mon, 29 Dec 2025 01:54:29 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFsxoEoP95m6ReZSz6r1q2uhNFZf5kjQYBZyqztpeqeumiInWw6+7PbX5zUgH0PIl8ztva/+Q==
X-Received: by 2002:a5d:5d09:0:b0:431:c60:c5ed with SMTP id ffacd0b85a97d-4324e4c1687mr36359670f8f.13.1767002068663;
        Mon, 29 Dec 2025 01:54:28 -0800 (PST)
Received: from localhost (62-151-111-63.jazzfree.ya.com. [62.151.111.63])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4324ea830fesm62245404f8f.20.2025.12.29.01.54.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Dec 2025 01:54:28 -0800 (PST)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Yixun Lan <dlan@gentoo.org>, Ulf Hansson <ulf.hansson@linaro.org>, Rob
 Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor
 Dooley <conor+dt@kernel.org>, Adrian Hunter <adrian.hunter@intel.com>,
 Philipp Zabel <p.zabel@pengutronix.de>, Paul Walmsley <pjw@kernel.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Alexandre Ghiti <alex@ghiti.fr>
Cc: Iker Pedrosa <ikerpedrosam@gmail.com>, linux-mmc@vger.kernel.org,
 devicetree@vger.kernel.org, linux-riscv@lists.infradead.org,
 spacemit@lists.linux.dev, linux-kernel@vger.kernel.org, Yixun Lan
 <dlan@gentoo.org>
Subject: Re: [PATCH v2 2/3] mmc: sdhci-of-k1: add reset support
In-Reply-To: <20251223-07-k1-sdhci-reset-v2-2-5b8248cfc522@gentoo.org>
References: <20251223-07-k1-sdhci-reset-v2-0-5b8248cfc522@gentoo.org>
 <20251223-07-k1-sdhci-reset-v2-2-5b8248cfc522@gentoo.org>
Date: Mon, 29 Dec 2025 10:54:26 +0100
Message-ID: <875x9phaul.fsf@ocarina.mail-host-address-is-not-set>
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: iV7U38nLyi0KMQkYXdPCpPRVB4mZCAEU_ZwDy3MO4Pc_1767002069
X-Mimecast-Originator: redhat.com
Content-Type: text/plain

Yixun Lan <dlan@gentoo.org> writes:

> The SDHCI controller of SpacemiT K1 SoC requires two resets, add
> support to explicitly request the reset line and deassert during
> initialization phase. Still using devm_xx_get_optional() API to
> make the request optional.
>
> Signed-off-by: Yixun Lan <dlan@gentoo.org>
> ---

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

