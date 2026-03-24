Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A55435AC04
	for <spacemit@lists.linux.dev>; Tue, 24 Mar 2026 07:54:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774338873; cv=none; b=kCIhB8onX55/PcybEBFHsx4ENA+iJKGVvSqvs8Q9J2d/dFVGhyjGggAcW/HcUJBRiZComBw89PYLlquuGoJcta1cyf1k1B28xM7KIwJAkVvlu2XmEokl0prDPpk3tdPmbI/zeQOz3bphNWpdKmOATQ/b4btOYw8ovVdKxGNgBis=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774338873; c=relaxed/simple;
	bh=kQnYsQgt15bMBS3ohsQp4zs/MlAmkjl/CavKkrpGC8A=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=mdVoJrdf75dahTc7KpfQLfJYQKyR0cEoDYqhWZdD/X2tpIC5KFpXT9W+O266LjbrN3sEBt7f8MZ8AgPCe0RnzZyI0ICrZf/s5iGTyLS8Y/1YvM+02l3LuRBvBVEJY9y4YlpD2ubocm3ZzOwkLmB4UqPdwsd1QMQlzwuFC5dTm3E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=c2LwzXe6; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="c2LwzXe6"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1774338860;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=NY5nUJKxwLcdpu7HOgzJTvPCYPrPJwn2RF0wTsX1HlA=;
	b=c2LwzXe6sV4357zCVVsCBFFCjkRkRL4UPEjHAlz3LsRaqUv6Kk43D72AohRNbYr7OBdBLJ
	DDep49VDh+9H6CXXDqwyIxRA/+AYO+QTOcdXVblJxs63b7HStdCdonO4snE5B0PksLeeK3
	vy58+kQGEnLpZyvv4Hu9sSMyVuKgfS0=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-169-FIELzP0jMu6FAGvdBuMF3g-1; Tue, 24 Mar 2026 03:54:19 -0400
X-MC-Unique: FIELzP0jMu6FAGvdBuMF3g-1
X-Mimecast-MFC-AGG-ID: FIELzP0jMu6FAGvdBuMF3g_1774338858
Received: by mail-wr1-f72.google.com with SMTP id ffacd0b85a97d-43b7ec737c1so987202f8f.1
        for <spacemit@lists.linux.dev>; Tue, 24 Mar 2026 00:54:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774338858; x=1774943658;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NY5nUJKxwLcdpu7HOgzJTvPCYPrPJwn2RF0wTsX1HlA=;
        b=KEfHgmzs2WQTbrIrAZN2Ook9jt3RymrVMwd2QalSKMCO28f2wWSvPg5xreQ3YntyEU
         9LZcFxpZBx3QHgXouepjTFHJHjHd1qWQtxqlA0doAqiol8VlO6SGwyHecTgy88f4h3wt
         yoc0pgEzgIWR9W4wcaYRUC9XpZwzNcSP5Yk6D8/vBv+WnFdNkHch6wIuptDFFimPRs0u
         795xbuSXC+F8/VLNjrA9n8K1dIdJc+b8wrWD9/lzhvVhDRFRLSDeZ/fbr3whPJhkINFR
         xaxyg9wIuCt7sMx1ZLNwHKQai8sJeYDJHNWSSVf9Zh17faavWtuKyHotDbNQidZXUqPY
         2Jew==
X-Forwarded-Encrypted: i=1; AJvYcCWwih6E6pRfQ+4Z8x8E8GiMlbN2aJ8DIXnM0VqOVBFJaILro0196Yma9E39kajwrs9Ahr05lJEzeA==@lists.linux.dev
X-Gm-Message-State: AOJu0YycC62OQDjLAbyvEoBWXerMb+G2N4jQX/v49tEBejtOyOUgIe0m
	UjfRfkvzoqVn1F/nPJL/KSasYUFtqmqIgqdcZp299q3KPGf+8mi1Qm7Su5JXxj2DQOufaYjacaA
	h+EPCpyyJhNxvXq8kVuMx/YBOIMIy0obLpSwlSDmviP9AhEXyOt/aCyloid64
X-Gm-Gg: ATEYQzx1gwLsK4e4rH3I+k8mW+iiMqhJjGNopZC4ckQqm01CfuMbh8T/g+AyA7DgX/J
	wz32Y/cpJngA3MU1HC+4gXce5NI828mE9/MpNHRjPqXmlvzcepzfv1aNVk0VILm1PB0eI9fsj4j
	bMbUfEO9nKnsGnuoFqdZhra6dMJw/ao2aWJEh17WIbyLY4seQqfGFxHe6FhdcTRjtviD8+27oZI
	ZtXZLu3lHIPuSHTFcdGWyg0vRDlpRKN5ku5R2xGHs80meKXPxCInwraG0zQ49FV/GqmHZKcGXhX
	0j+A/AHKLwvAnH0hyLg20zIBWmlzdAFJr6vQhxrBSCRATVDL2JPUDbM9/41WHp8i2XdwI3MxIFJ
	ai1SZC/kK6bO3MuGgmUKsmdZzLOCbneJMg/mTWrtFvRvDAv0Wag7IZ7a/LqPLe2n4RJR4wXeSCa
	A6AB9l
X-Received: by 2002:a05:600c:a6a8:b0:487:12c:e7e1 with SMTP id 5b1f17b1804b1-487012ce8b0mr126639305e9.11.1774338858155;
        Tue, 24 Mar 2026 00:54:18 -0700 (PDT)
X-Received: by 2002:a05:600c:a6a8:b0:487:12c:e7e1 with SMTP id 5b1f17b1804b1-487012ce8b0mr126639145e9.11.1774338857718;
        Tue, 24 Mar 2026 00:54:17 -0700 (PDT)
Received: from localhost (62-151-111-63.jazzfree.ya.com. [62.151.111.63])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4871174f2desm38779755e9.9.2026.03.24.00.54.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Mar 2026 00:54:16 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Aurelien Jarno <aurelien@aurel32.net>, linux-kernel@vger.kernel.org, Rob
 Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor
 Dooley <conor+dt@kernel.org>, Yixun Lan <dlan@kernel.org>, Paul Walmsley
 <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou
 <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>
Cc: Aurelien Jarno <aurelien@aurel32.net>, "open list:OPEN FIRMWARE AND
 FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, "open
 list:RISC-V ARCHITECTURE" <linux-riscv@lists.infradead.org>, "open
 list:RISC-V SPACEMIT SoC Support" <spacemit@lists.linux.dev>
Subject: Re: [PATCH 1/6] riscv: dts: spacemit: add LEDs for Milk-V Jupiter
 board
In-Reply-To: <20260322203356.2206927-2-aurelien@aurel32.net>
References: <20260322203356.2206927-1-aurelien@aurel32.net>
 <20260322203356.2206927-2-aurelien@aurel32.net>
Date: Tue, 24 Mar 2026 08:54:15 +0100
Message-ID: <87ikal8xy0.fsf@ocarina.mail-host-address-is-not-set>
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: XgDcdNjcXrudKM108uu3ONeOyzAVV7Ytjl7WUIsXXQ8_1774338858
X-Mimecast-Originator: redhat.com
Content-Type: text/plain

Aurelien Jarno <aurelien@aurel32.net> writes:

Hello Aurelien,

> The Milk-V Jupiter board provides support for two LEDs through the front
> panel header. The "Power LED" indicates the system is running, and the
> "HDD LED" shows disk activity. Configure the corresponding LED triggers
> accordingly.
>
> Caveats:
> - The LEDs are driven through a 4.7k series resistor, making them
>   quite faint.
> - The disk activity trigger requires a storage controller on the M.2 or
>   PCIe interface. That said, it matches the purpose and the vendor
>   kernel.
>
> Signed-off-by: Aurelien Jarno <aurelien@aurel32.net>
> ---

Looks good to me.

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

