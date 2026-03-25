Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9EF8823B612
	for <spacemit@lists.linux.dev>; Wed, 25 Mar 2026 13:20:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774444820; cv=none; b=OEypeQ3eJwdIuSx4mNFC/qmEqj7ELRP6iNK2j7Mmi5HywRrAcGV2Mxnw0S+9yvk3FVAb1yfDDroyexhs9Ys072VznPL+PAHi3u5gf+qHM//fj4ezEPX9URXlIibai5pkkYnmEoV83ZzrNZC0/bf7x+oG90Zyeq3mteuTjDg7T8c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774444820; c=relaxed/simple;
	bh=8OKtuZUHYMcCm3anyLFXklzdxMpproKBUw/yLg5vFyI=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=Wm5bW7len64/DohB4u5815cZYT+lDafpf805YYkWU8+Jf8n6Wjs73d27kX0etTyNCIZcCYrRUFVbxf/4eGHcWeleVypqIwYZXEZgMoWFrdQvFV3pfKgi2LpqIteUV3TlRiVX/jDoP0w7MMlchrP/xP1OazcL/Y4WLQx4CRYqUto=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=g1SmFz9m; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="g1SmFz9m"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1774444818;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=KRyCtRyiP2wwgn3R3NnCHPYbolki/Fqd18W5MnkvIrE=;
	b=g1SmFz9mPgaXM/zctv4gHlp6KJIrpeM2NU3NpuIOegAjVmZruwf/Dj07by702796rj8oXt
	Ght9uOhg8Y6CgmexVsRoX5g4guoGVRRpdOB1DXJzxx+zbNetylhQ26yvRTauAgh38qguIZ
	EiiPKajjxjG2v7hoK5F/srmy0d7tikQ=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-602-GFhlOo9hOsurjXEselCMYw-1; Wed, 25 Mar 2026 09:20:17 -0400
X-MC-Unique: GFhlOo9hOsurjXEselCMYw-1
X-Mimecast-MFC-AGG-ID: GFhlOo9hOsurjXEselCMYw_1774444816
Received: by mail-wr1-f71.google.com with SMTP id ffacd0b85a97d-43b8cb800f5so679001f8f.1
        for <spacemit@lists.linux.dev>; Wed, 25 Mar 2026 06:20:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774444816; x=1775049616;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KRyCtRyiP2wwgn3R3NnCHPYbolki/Fqd18W5MnkvIrE=;
        b=W6KdcsoA9vNiTPnUJBOaWmxJwwsYajGBwCxH9dxvfIpthiE7bqm44Zl7/gTROyqk4Y
         08issVmj2b/PyahVLQ7vZxZufoD1kZE25oW6kdJaHPgiiptsHB+umkmvR27nhNYz9BpR
         DGeVlbmNZdaEArbBX7Z49MFWq233k+efyIyUhugk/V7UZgSHY2s/j5bY9GGEd8S8kYlf
         En+h5y1Do7ZaDrBQCKtluLvvSyTP1/bbjV7IkwLj7jpQZVNHP7WwaPa2me9W/3/ExWAf
         lxgX2xXKRmyUvPHS2t8eD6mbhKLlPRVOpH/rFX2idmv5+zUa/Px3O2osg8DfXk5QLrQX
         uE6Q==
X-Forwarded-Encrypted: i=1; AJvYcCWRMPfR+ciWzE00e5ZS9dr6A4iPoq+u9IsAqrwXMo2RefBGSIIzs+kSZzwpamQh2e3JxqA6vLM17A==@lists.linux.dev
X-Gm-Message-State: AOJu0YyvUATM+dQEWb2dbXIldLwOgUaHxK2EI8vjqAe5E1l5joBI3B/e
	As6DfIZW4StLJUfRDNMfSswq/fkcRaFvs4pYU9IC8NLIlFgqgzjaukpJMNv0obzsGGdDZ5Yf0jT
	db/83U8WDaUMj3MXaf6nZvz/kJ6wcgi7Sb9eGgOd6bFyuCj/hoogOKPrwkDQZ
X-Gm-Gg: ATEYQzxt4yX0DkRNHg3eXY5lyTGK1E6FZdi3nredNhzqZ9j+D2Xl2gW5JA7UB753sFo
	FSwh8GGG+im9wk64/AVu7UM+IvvdDqxjb7pbUQtN5cCJAxWlQiKHSwgblnW7L0/K8lt2I2GPqt6
	oA9KoLt3+CLHVACMAn5mRb4Mh9PuK/fo29GNKj7WHdM4vKQX+jA0Dl9FndTU/hIor4jHjaEerkh
	AsLX55M4jP9/p/P8Q48+Wae/eDk3zDg6WXWD/WfyG4EHdwjnH9NW0Ucc6O9ZC6cKhI9cL/emjNY
	bxfONkRRY/pe+CO3LpbZEUhwhgtbmFWspSI4PviKlXF/6dZ+ev6W23o7hwiUt3QqOnUq8kZHGkW
	W28sPhZefjZaiAzZVNG2nET8w+VA7dm1nF8g6kdG3TKSgaqt4+455WcrtOSFsGqD3yPJm2NpvhS
	xCBBg4
X-Received: by 2002:a05:6000:2dc6:b0:43b:6955:54c5 with SMTP id ffacd0b85a97d-43b889a872bmr5150954f8f.17.1774444815985;
        Wed, 25 Mar 2026 06:20:15 -0700 (PDT)
X-Received: by 2002:a05:6000:2dc6:b0:43b:6955:54c5 with SMTP id ffacd0b85a97d-43b889a872bmr5150862f8f.17.1774444815376;
        Wed, 25 Mar 2026 06:20:15 -0700 (PDT)
Received: from localhost (62-151-111-63.jazzfree.ya.com. [62.151.111.63])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43b8567b2e2sm11278629f8f.33.2026.03.25.06.20.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Mar 2026 06:20:14 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Yixun Lan <dlan@kernel.org>, Andi Shyti <andi.shyti@kernel.org>, Rob
 Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor
 Dooley <conor+dt@kernel.org>, Paul Walmsley <pjw@kernel.org>, Palmer
 Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, Alexandre
 Ghiti <alex@ghiti.fr>, Troy Mitchell <troy.mitchell@linux.spacemit.com>
Cc: linux-i2c@vger.kernel.org, devicetree@vger.kernel.org,
 linux-riscv@lists.infradead.org, spacemit@lists.linux.dev,
 linux-kernel@vger.kernel.org, Yixun Lan <dlan@kernel.org>
Subject: Re: [PATCH 1/2] dt-bindings: i2c: spacemit: k3: Add compatible
In-Reply-To: <20260325-02-k3-i2c-v1-1-78f29c83d9ac@kernel.org>
References: <20260325-02-k3-i2c-v1-0-78f29c83d9ac@kernel.org>
 <20260325-02-k3-i2c-v1-1-78f29c83d9ac@kernel.org>
Date: Wed, 25 Mar 2026 14:20:13 +0100
Message-ID: <87zf3w6o6q.fsf@ocarina.mail-host-address-is-not-set>
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: wylZy8lP2pMQV1ApScFQHmH4wPGpOVjxJ3_9sSRmfsE_1774444816
X-Mimecast-Originator: redhat.com
Content-Type: text/plain

Yixun Lan <dlan@kernel.org> writes:

> Add a compatible string for the I2C controller found in SpacemiT K3 SoC
> which use same I2C IP as K1, so make it fallback to K1 compatible.
>

If is the same IP as K1, shouldn't the "spacemit,k1-i2c" compatible be
used in the k3.dtsi instead? My understanding is that this is the meaning
of compatible, and there's no need to add another compatible string for k3.

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

