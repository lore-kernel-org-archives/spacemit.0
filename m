Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 978EE7080E
	for <spacemit@lists.linux.dev>; Wed,  5 Mar 2025 13:31:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741181515; cv=none; b=sDIrGrpC+O4xwsFGXWpjnH2aiCxnUENW4YA5La4A93exU3iYYSyBuV1qir1bdLXU8DGOkZBrZ+1TjLa5G4zgKBmr83rTabwoFt0Fg8pX2g90c2RAoMTwB6OC+VW3tCSYPqKawwk8hYOnTPkMwQ2MBTgLMoTG+Dl3gbNGnj9Vu7U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741181515; c=relaxed/simple;
	bh=u2oWUXx1pOYjOKkp+cRuBclke+M/qTXSU/sDancxH1A=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=hCin7qnSGbzNO+mkqwcoAH4vQlpikcR+4hMNtw1ZPJXc8nLbZ2myk5N9FehbVeh+vPITeGFsvHfiYKX4kO7oXMP+nQYeXnagjtQl+lkXFGHumzZyxfQ2O77fFZS6IC4PnH8tuc3f4Q1hKkfH0dPmzQUM1kNZyjkkl6ufIs6lsno=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Ab9KolDn; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Ab9KolDn"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1741181512;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=0dqn34a07lKcr5dJFV5JIso+d1clQqATo1u77Mk28XM=;
	b=Ab9KolDnff+zhlvJ6YBKgtSH5Wvgmq9rpPWbYIKBBJpYYGXm3thtTi+BoqS5k+9kKfyFEl
	RQdmwYNqWnYlCsgXXihLAwzCiWKo9+l1BiI2zjxGhYxJIpbhy8jpfJ4the71/3w9vTMaWs
	vjgNlHwpMyOsMuo0YH6h0LbuEGbM27M=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-350-kHcscocbOLS1nG--snYQ7w-1; Wed, 05 Mar 2025 08:31:50 -0500
X-MC-Unique: kHcscocbOLS1nG--snYQ7w-1
X-Mimecast-MFC-AGG-ID: kHcscocbOLS1nG--snYQ7w_1741181509
Received: by mail-wm1-f72.google.com with SMTP id 5b1f17b1804b1-43935e09897so49632225e9.1
        for <spacemit@lists.linux.dev>; Wed, 05 Mar 2025 05:31:50 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741181509; x=1741786309;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=0dqn34a07lKcr5dJFV5JIso+d1clQqATo1u77Mk28XM=;
        b=ReB79evGCwNBlAEKetsUn6EZM/gLPRVvcbEC+iFTmHdfBAnuuzZYdoPPJwxo0JMRZS
         8XPf8eTpMsAAh/lFmFXOZ7GY2UJU8hj8O6H7XPcWNq9jjETcHzy1AOlCPK7LpHM9w27b
         ywEKrToQbRpOWRh38u3E28ZSw+fqBsnFwZsWENE7dwMOjz9z5DF2d1wc6rjds7LRSx8F
         atH/jdR/vgWJ8elUfQfIpSrjAAqIJjaHTr/SdrzYaXuxtuqQq2IK/BaFvZ66lwmdnOaC
         wYOExJaM9UGNIOsw1fg7NWNvj/ZlQabS8lchHrY1vqZ7FVkX+wyriAq3e5LdNWtrAJIg
         VRTw==
X-Forwarded-Encrypted: i=1; AJvYcCVlIqYjOpZ2IXAGfeUUk2rmGcanDLvovBaTXoHWL9tabRMhK32jMrnt1nxK1T27b3NT1KVn/mzaoA==@lists.linux.dev
X-Gm-Message-State: AOJu0YxpkwBYNDs4oSKktEwWQpaz7JlVb83j3ORfLf+Gp9RFmhzxT3qC
	aIUECqTJEvn8tzyf3Jif/XQoNOI9u76U74yX50dgwgFPKmGrVD6s6iBd3WRAf4zpO0XLND9jyHl
	X6vWc3SMfn/A/axN237uZx2s/imdhebt/tQlyM/Yk4fIBAz4C0nXhn9i+NsVyY7wx
X-Gm-Gg: ASbGncv15PLPVdhT+05SUSSh2SiI2dj6GJYy0XAtBmFNu0iqcvbOsVtLuzPwf1RXrxr
	MSYVBuz7H/qneaKYkblRpy6AU3vq9ap8Jd+JkT+7+7SC0DKFdOzMuIdcB9X0msJUN9rJeHBfaTV
	V9U4CjdmXnf+AVJ6rCQJH+J0+Z0iGE6NE7pS/BWzJhw+DDdEzk6YhtGIeLTh8bgtrNel8MHqOMM
	wWaG6SIUIu/lcz38gcVzr8fLu0gIvnsOfwehT7/PIBX97fkdY+GsYkWh+6nKo9MMesMEWDWGrsi
	tUcp+6wO/5KPCeaWSd5C1yHGl+guK4vF1vgkkxj1q8xoxJKHou5Tt03AZ7DTe6cWNYsa5OOn5g=
	=
X-Received: by 2002:a05:600c:4ece:b0:43b:c94d:e1e2 with SMTP id 5b1f17b1804b1-43bd2ae54bcmr21140285e9.25.1741181508722;
        Wed, 05 Mar 2025 05:31:48 -0800 (PST)
X-Google-Smtp-Source: AGHT+IG7F9v/2ONxk8xFOjzjpCwwBkyc6Bvd4KwZ9m8e5e3MHZoEGLxssf5K5UetRRU+tpmyYly/Lw==
X-Received: by 2002:a05:600c:4ece:b0:43b:c94d:e1e2 with SMTP id 5b1f17b1804b1-43bd2ae54bcmr21140075e9.25.1741181508323;
        Wed, 05 Mar 2025 05:31:48 -0800 (PST)
Received: from localhost (62-151-111-63.jazzfree.ya.com. [62.151.111.63])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-390e4795da5sm21372477f8f.15.2025.03.05.05.31.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Mar 2025 05:31:47 -0800 (PST)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Bartosz Golaszewski <brgl@bgdev.pl>, Linus Walleij
 <linus.walleij@linaro.org>, Yixun Lan <dlan@gentoo.org>
Cc: linux-gpio@vger.kernel.org, linux-riscv@lists.infradead.org,
 spacemit@lists.linux.dev, linux-kernel@vger.kernel.org, Bartosz
 Golaszewski <bartosz.golaszewski@linaro.org>
Subject: Re: [PATCH] pinctrl: spacemit: destroy mutex at driver detach
In-Reply-To: <20250305102710.52762-1-brgl@bgdev.pl>
References: <20250305102710.52762-1-brgl@bgdev.pl>
Date: Wed, 05 Mar 2025 14:31:45 +0100
Message-ID: <878qpj8uym.fsf@minerva.mail-host-address-is-not-set>
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: CwIPFtasMBmebN139ZTT9gMRTmHCu6zIEHzBJYzb3WE_1741181509
X-Mimecast-Originator: redhat.com
Content-Type: text/plain

Bartosz Golaszewski <brgl@bgdev.pl> writes:

> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
>
> The mutex initialized in probe() is never cleaned up. Use
> devm_mutex_init() to destroy it automatically.
>
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> ---

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

