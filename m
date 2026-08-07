Received: from mail-pg1-f181.google.com (mail-pg1-f181.google.com [209.85.215.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BFCD537D124
	for <spacemit@lists.linux.dev>; Fri,  7 Aug 2026 23:52:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786146725; cv=none; b=E1XmclVIa2siOMOTO1FfXW5GSK5+BrbQ+/ZqN8C3W4QIAHJngv0YTTDQm3c9092YEGX5k6IAKKRoNypmmm+hDHIj/uoYeoSp7S1xn7AW2+drNJVAVcSyPYR7CnsKIRWQsgka34A+BmemasY66hJqGUrjDkDNGWC5wRkO418RYnI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786146725; c=relaxed/simple;
	bh=LwprOu2PVhMpOrehyusrpzxDAhj1sLK/5uM1aU7zbd4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=S7OnWUvoslo+N3KKzvMZM/TrpjT80FmFKL54xHdqtiBawxIzHQfGj0om+NssxKv5JHdGaoGkZ/jJFpe0OxCrp1CGhGQwiNx2bdkqsZz23Do5d6490puMnVMJ8UHQWrCmiQo+735uniG6tBETh2s4H2510MYUtX2igtdSy0Xti1c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=e1g8iKNw; arc=none smtp.client-ip=209.85.215.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="e1g8iKNw"
Received: by mail-pg1-f181.google.com with SMTP id 41be03b00d2f7-cbb8b54fcf8so30576a12.0
        for <spacemit@lists.linux.dev>; Fri, 07 Aug 2026 16:52:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786146724; x=1786751524; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=LwprOu2PVhMpOrehyusrpzxDAhj1sLK/5uM1aU7zbd4=;
        b=e1g8iKNwZfAWCI43Z89UkdvRkqc/YIiUUONrv4mGSTY8BvZG6BB1HGY52wf9xdP1Iz
         az1yTc2UFfVEoUXQzW494qU47fFNgE4yljL+WXV02xY1mDpc72YRv1a1GZvao7wH2r3a
         zjUKPGSzFtu6zj6RHmyju8SwhNGF/m3515q5epq6iQcsOnRgQgX+L1gzQv1BjZ6a+EVp
         Xm9DbY0fsJC3d0ONuxdYzP1p0XjJDYa7GmzrikGJZcQXQbEBQlg6OSkUASEb/MN5V990
         oBKzkvArUUFcy1JlT0gNVxtAfEak2dNvfTzL4KAXtRVkgBh3dMLyePXsRb300oPN02w2
         sUKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786146724; x=1786751524;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=LwprOu2PVhMpOrehyusrpzxDAhj1sLK/5uM1aU7zbd4=;
        b=RP/XpM571sm47XFzyosKBLOIDTr/eUbHHxthbDuYChFzqy5pUFMDOrEwxsy/yxvY9X
         3oltzpk4t+Hfs2rdnwEwC/Q8ZQSAGPJt3vP6ApWwW+FEroEi4IdeKuPqBr8zBaiwU0Sv
         CLCwD7GruyZQRZaLqXO51qyipw9FumN38tBHx1jVkLvoAoZsav2gDp2aBFJGJxKLy/qL
         +3O2g0b4Vr6IggBSUUVCOETl0e3HijiOGyrkMVQs/poNjFVZelHd7Lo3DDWB+JYo9GUZ
         4u9DEdnf6KJcXK13dCo/6Y5LDa92I8+9xMoAWrncN8ShUpAZq340rKtnM6DHqFcK7792
         FOxw==
X-Forwarded-Encrypted: i=1; AHgh+Rpz+Py/E3LRsDKEnIRC6r0z5EahKeQutWICregY2WDfiDygnR75OM5eoLTT5pVzx0O40/j2jh2ojg==@lists.linux.dev
X-Gm-Message-State: AOJu0YyBEa+U1yRvsxJjOcw/o3Ngi4sgbTvmf1FSGm0P9BmPjXZjhNiY
	lS/aa98WvcwSd2uPM1enWnApMLJcpU06KfWifI5DsISDPMfQMqwdjQL2
X-Gm-Gg: AR+sD12G4z5DD6vOoIPFAD8ojAPlCCeDw28P5QW74nRz154kjgjF/qH9m6ZVJjbq7Jq
	ZB+LDEBh+XDOTjLaz93p9CURqsJIA8DnLChZH008HSqQqUy6gjxjqz+zJfV9xb/3sD75SlXuHNv
	yMzjgkIi7NnHfkiAZmgFYABjj1bvDgW/oMnxSKQJjKcfrlK7n3ZSqFUOEomlr3qwHAbbuFXvZIf
	Xf4MT/OQo1RGubHkfckKwZAVp5sBycRBFSegxj+d1VQEswRwEChbLiEHPZQm7DIieosbi4SPAml
	MsqPDg2WRegEk9Yq9mevhobpFXTliGELkw4cDrfIaMdGIidG4Cbypp+NRY+3yEdPhG4yUHKWxG+
	m2NNzEFMmRX+rb0GEU09tcQQUADA2lfOrzpU5dehLUCNKx1+dKAbYu0j878YRQe8qHcMbmi6TOZ
	DF0SEnwOLp11DbtiVec1XXDUmcc14l9qUe8A==
X-Received: by 2002:a05:6a20:e290:b0:3c4:3112:33 with SMTP id adf61e73a8af0-3cb85de7c9bmr30699536637.6.1786146724017;
        Fri, 07 Aug 2026 16:52:04 -0700 (PDT)
Received: from localhost ([2a12:a305:4::40fb])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cbe8f198d44sm1318623a12.5.2026.08.07.16.52.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Aug 2026 16:52:03 -0700 (PDT)
Date: Fri, 7 Aug 2026 19:51:46 -0400
From: Guodong Xu <docular.xu@gmail.com>
To: Philipp Zabel <p.zabel@pengutronix.de>
Cc: Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, Yixun Lan <dlan@kernel.org>, 
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, spacemit@lists.linux.dev, 
	Alex Elder <elder@riscstar.com>
Subject: Re: [PATCH v2] MAINTAINERS: add entry for SpacemiT reset controller
 driver
Message-ID: <my7qwtgrgph43hjxwmjm5hkeuxltlqjntnj5zdo7xqlrfrlffx@fp4mt7phdor4>
References: <20260603-b4-spacemit-reset-maintainers-v2-1-db0716d43a7f@gmail.com>
 <62e1781e127176294088cee9c120b3173359ec4b.camel@pengutronix.de>
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <62e1781e127176294088cee9c120b3173359ec4b.camel@pengutronix.de>

Hi Philipp,

On 2026-06-03 09:34, Philipp Zabel wrote:
>On Mi, 2026-06-03 at 06:26 -0400, Guodong Xu wrote:
>> Add a MAINTAINERS entry for the SpacemiT reset controller driver
>> (drivers/reset/spacemit/) and its reset-ID header. I intend to
>> maintain it: the K1 and K3 instances now, and future SpacemiT SoCs
>> that reuse the common code.
>>
>> Link: https://lore.kernel.org/spacemit/20260120-k3-reset-v3-0-effe87f4bdbe@riscstar.com/
>> Acked-by: Alex Elder <elder@riscstar.com>
>> Signed-off-by: Guodong Xu <docular.xu@gmail.com>
>
>Acked-by: Philipp Zabel <p.zabel@pengutronix.de>

Gentle ping. All tags on this one are collected:

Acked-by: Philipp Zabel <p.zabel@pengutronix.de>
Reviewed-by: Yixun Lan <dlan@kernel.org>
Acked-by: Alex Elder <elder@riscstar.com>

Could you take it through the reset tree when convenient?

Thanks,
Guodong

>regards
>Philipp
