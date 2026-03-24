Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B70F332EC8
	for <spacemit@lists.linux.dev>; Tue, 24 Mar 2026 07:55:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774338956; cv=none; b=eQeA0ggMzc1Uf2ah9sEDD4f0yUlICEhMWGXJIOroHWXhpuTvx/txuU2zyTDMOllWTIQTSaRxI0/dpwvTkbLUZEKZNp02LBk50BeDfVcX8ECTAXwu6DGD7Q3v5UjsbT18TUmLDb+JO5Jp0jQ0KME6m/3IjB15vzvuMXP/DYCrsXA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774338956; c=relaxed/simple;
	bh=sVVLRcjpRQbfkQhkDa3vSA5KAE5n6GGfeGlTpUj4bbs=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=bG0FnesAENSOp+b0m9N30hBbgKrwYYGfbQACQ25hnaqZOFMzwjfTYDTOV9kAAi5J1BzGo67UawdBddWN1OTrgHJv4w2qIXtq5ZiAE0xeFFLFQapzCepGNSDhrqqJnTkUl+9hxUTWajbC6EozU8cjTV2sWT2GkDbbXX8owpOfrUs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=gjOa5uvA; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="gjOa5uvA"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1774338946;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=sOje9mFQgZLabauafbcXtKwoL6t2U90aeB7/bcx32R0=;
	b=gjOa5uvApe60sU+1wM5texSe/m7wjUYSU2u17oEGtsSws4B66FCxIQ+z5I0YZLYsJ8q4aF
	hetMoOb3s2KKYcY6wnQtV+EkzFNgeXUpE+EWG3EKtk3UntlrVAsXOkOmgf+qNFRQAQW2Iw
	ouD9KwAGqD9LibP9w1KE5elVKdxrPHI=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-651-bmixXovyPrmv98VRHankSQ-1; Tue, 24 Mar 2026 03:55:42 -0400
X-MC-Unique: bmixXovyPrmv98VRHankSQ-1
X-Mimecast-MFC-AGG-ID: bmixXovyPrmv98VRHankSQ_1774338942
Received: by mail-wr1-f70.google.com with SMTP id ffacd0b85a97d-43b4e102d77so3040773f8f.1
        for <spacemit@lists.linux.dev>; Tue, 24 Mar 2026 00:55:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774338942; x=1774943742;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=sOje9mFQgZLabauafbcXtKwoL6t2U90aeB7/bcx32R0=;
        b=IRVJpt/cfM/zJY8y13yy17cTVixRbSPiOu2RZhetaz1p2joRYs3z0TFrr68ecifVRW
         6uqZE01DPSGgd79vYMt7BHnKgL3a6fKhL+VBvwc23JwHxLjAZniJxn71iaEZcbAlh9K9
         zD94RlNNIU5bdkBgxqojt+WdTggQvzF6qL1W2kjcCrpCWKsaYNZIK4KGLZbO5q6YXfa0
         Brivt+WoNeCRvTArmY9Hg1tfufXvHkkI6kigY1oF4kETvsvV24MVNXYDBnjmP9jRSoBN
         Vusuchk1bXzFVG5pAJqdxlAMSLXJCIQ2BSC/2OImBOvEFvP6NGBgvf1uSnKpVfXjF/Nq
         r86A==
X-Forwarded-Encrypted: i=1; AJvYcCX+LsRHvl3KH2z4rgjDzTtWqrgX3bhXEZNuzrANxvOyr5d+P12OL0nAmhZ1Yv6McMAJ6lgrGO9xug==@lists.linux.dev
X-Gm-Message-State: AOJu0YzXFu/xJ9ozCXicTu7zNiOgI9v0ASq/bDCtNoNYnIyreEVx81kl
	6RXrCOV4YT8DheeGovYPjo7hM4s1fEg2EamZ21daGbYzWdEv3PIcGQcf/o4Kiy3LvCCOZ7g21C2
	twlAQgoxUo5b8AOQ+YUKBfS86K6MDCucFNPD8NiFlLb6O7MQYRT8GsWGR8f4T
X-Gm-Gg: ATEYQzwF2Q7x2Ur6Fp6rIs5GqCE10coPdWkzlVwXiZOhuPKb3fxT6HD1CrGuNqzXv1F
	6aHK5JizRMVmr2XgI6WcEazZ2nafU0rGMrhhm+J4KSrgm5upF7OLPkoV09w199GYCh0q6nFge5B
	F/fjMwYAjbeGPLuaSl0Sxki0nZKD+tY3/R0n99sfTnbYaMjwHgVa2e0wn62Pm6+UPQw2ZgN1N4b
	zd172ylULhJzCFHIHADk+jDd/YxxbbF1cCv1VtD7o4tw830HdZ/hL8xh0+cJlPthO1zDQIJyJDj
	DkbeKXPbF4vvVVHGekQ+bNMZBvPccvHMX9VnW26oz9kYoTG1NKESg6y4u0YP9TUvKzUPab7MKqL
	JVl4lGZJqAgQOvcczRTTUqCMAG1ZkthtwhJQR7UCZS7eYe9/pUKK84QRF7BiGXCUkG8k3KiwOLh
	yOpsg8
X-Received: by 2002:a05:6000:1843:b0:43a:580:eb02 with SMTP id ffacd0b85a97d-43b6428976emr24163900f8f.49.1774338941580;
        Tue, 24 Mar 2026 00:55:41 -0700 (PDT)
X-Received: by 2002:a05:6000:1843:b0:43a:580:eb02 with SMTP id ffacd0b85a97d-43b6428976emr24163874f8f.49.1774338941179;
        Tue, 24 Mar 2026 00:55:41 -0700 (PDT)
Received: from localhost (62-151-111-63.jazzfree.ya.com. [62.151.111.63])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43b646b0b0csm34387215f8f.15.2026.03.24.00.55.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Mar 2026 00:55:40 -0700 (PDT)
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
Subject: Re: [PATCH 2/6] riscv: dts: spacemit: add 24c04 eeprom on Milk-V
 Jupiter
In-Reply-To: <20260322203356.2206927-3-aurelien@aurel32.net>
References: <20260322203356.2206927-1-aurelien@aurel32.net>
 <20260322203356.2206927-3-aurelien@aurel32.net>
Date: Tue, 24 Mar 2026 08:55:39 +0100
Message-ID: <87fr5p8xvo.fsf@ocarina.mail-host-address-is-not-set>
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: GXMnf9ieD6EAHbW4tWsFC6qWRggDJue11h44zIQOMwk_1774338942
X-Mimecast-Originator: redhat.com
Content-Type: text/plain

Aurelien Jarno <aurelien@aurel32.net> writes:

> The Milk-V Jupiter board includes a 24c04 eeprom on the i2c2 bus. The
> eeprom contains an ONIE TLV table, which on the board I tested only
> provides a product-name entry. Expose it via an onie,tlv-layout nvmem
> layout.
>
> The eeprom is marked as read-only since its contents are not supposed to
> be modified.
>
> Signed-off-by: Aurelien Jarno <aurelien@aurel32.net>
> ---

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

