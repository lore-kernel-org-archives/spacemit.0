Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E8D73093D8
	for <spacemit@lists.linux.dev>; Mon, 15 Jun 2026 05:24:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781501083; cv=none; b=odyUjoGP+yFkfzJkXKJk8tTpe06k71zUaSy7AIOw97sP8nh4s2BL+HeNKK4MYzpdnMaj9kbtkdz/+ru2+i4wpbJnjttdR+DLLxCC86notl+2OE5HlrizqObmoI6JAkQLX5gF8VAdh2oZXhg7LO+8CyBIY+YLfsTq2Vje8vtY1UI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781501083; c=relaxed/simple;
	bh=LKyNhJXz1JIaxAgZZafPKVNcBtAvTVXc1u1KD9jTvq8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Uq8+HrlVpdDOtYoWrjECjDa0NZYFCHknt0Oyvxco90JklpF5i/FhkMyma9hH723QHvoNIyayB+666PpGgZZDjF0x7sFinhvTqM0qGvQbxL5Fs4tuKLC+Fi4N2yzJ8QXNDciESs7169TWv8LVlyvFjtXdAzXQ+6pxfqW4o62xLKQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=nOH/BSGi; arc=none smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="nOH/BSGi"
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-2c0c3543590so19528135ad.2
        for <spacemit@lists.linux.dev>; Sun, 14 Jun 2026 22:24:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1781501082; x=1782105882; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Rpcf5mhYwCy+kQj8P5K4qfITxeMqEuvewMFhwML0GRs=;
        b=nOH/BSGi2BV0ozS/RYxg8UJj5CLlf0vpWgcIGmQRWcmbxX6ZxbT8+GpDbJXp+gQ+Mf
         7qRthAiA9ZL9pvoyeT8lb5WbX0mhyWBping8HNFPdaWPOUB+UlLcNY6hOHX4KZBfWcF4
         rM4pP3umMpgVdKflFH/i+MI94q7QrWiqFyEbiaYRN8ObVmoc3nGOBGDlSuTmi44HRflI
         yHC3l2+bQXqfAN7JBNiADiBKoKJpY9flSJS6/0VMxf7yIqoZyMqhgLhV2enzKA9Z6vF9
         coKn58gjpKroCL5hWTj2SaBlo2+98us7vBLQrWl2FlYNiMCQEe36LOua/knZ6GrwgVTS
         CrAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781501082; x=1782105882;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Rpcf5mhYwCy+kQj8P5K4qfITxeMqEuvewMFhwML0GRs=;
        b=qGdtG2KciRd9vCNL0CIlSMMM1vkTdrFqGl2MIoXpgsoL248GP6DyaFG/Hq8cc6k1fA
         kNXuegX1CtUxX7/T7Bga8XKDc/JzTMDFiOc/XaWS7JLKqE5hETrDvuSIIAnkjGDvjGQG
         avqk3DmE6Aod9s2BVUV4edCr443nugRH3mqPAuHDFogOlM6F3NHPFpZIV45PBRM/Eh9W
         PsDcfiHvUrA4/YMdNEK6lQPz3zIxRzk0h/vIxegIX+SaCMWpC6zIPSriC9xAuaYiSMe+
         WkQiSWziyK5L4oZn7L3kxv5TkR7zwxHL/bRtXYadUII2wCu4NUzEdBGRXLZH1dfHeaI3
         Vwug==
X-Forwarded-Encrypted: i=1; AFNElJ/KC41QUjIREIO4vs8kkQxM6ArYWV/1it6C2kckqX29dywiJoUoOPDFUrik2fGn4V6uLZc1kvSTmw==@lists.linux.dev
X-Gm-Message-State: AOJu0Ywd7Tc/MiLABbGza5W8UDDYnFJWGq8far6c+PRLwSmbE4L7H7WA
	TdQFD8lBHrOT7UmipNSaoA/JBQ36W+Z4xtY718GEcaxPSd/NLcH13d2j36s67LqGOjg=
X-Gm-Gg: Acq92OH5UHXar2y4FoyKLecR/l8SwXMTbx7SXw+o/VsvoiDENECpf7+MC9jSok46gHj
	GSEfHWFJgPuWG8GE2pTMUN82pZo9OftjzoEz9+FUQgSonrldTkH0mMzJAaASLakgna5LkO8Pkqw
	N34Lkvox7ZieZ3PtDdTjMbLWuF12TkayK5g2lcCjm+fHT1095yH5QgNwgEAvJGB+XNckG1aNC6E
	30UM0SgkNhsyQEDgt3fS3BDhelZP163Vxpxs2e04GtsWBMsAW6q8NNYUT0ciqtfn5sCp98VUqGh
	V81Ilj2TMHBYLxp+UhlrI+1Q0wZUQe37V50zjBQ6lB54yS0wUPhkjgn36JSBcQueyEEJlW49pgm
	4ADstehtkK4CbYAx++lu7yRXE+TrO/8qUA/3r2IYDK1TAnVH9dy2UMzEGbRXD51UDV0HzztpFFC
	rvvst+DGRSfDd08+21DX/xpmw=
X-Received: by 2002:a17:902:fc8d:b0:2c0:c0fa:1659 with SMTP id d9443c01a7336-2c413dbe166mr150322135ad.33.1781501081641;
        Sun, 14 Jun 2026 22:24:41 -0700 (PDT)
Received: from localhost ([122.172.82.94])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c4327aca9dsm87824995ad.50.2026.06.14.22.24.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 14 Jun 2026 22:24:40 -0700 (PDT)
Date: Mon, 15 Jun 2026 10:54:38 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Shuwei Wu <shuwei.wu@mailbox.org>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, Yixun Lan <dlan@kernel.org>, 
	linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
	spacemit@lists.linux.dev, devicetree@vger.kernel.org
Subject: Re: [PATCH v3 1/2] cpufreq: spacemit: Add K1 cpufreq driver
Message-ID: <bd4s2icqgusnuujvrpoag4cniy3g2e4bumecqxt5yffl77aqpq@kxg4dj4c2wk3>
References: <20260612-shadow-deps-v3-0-2f3ba88611ff@mailbox.org>
 <20260612-shadow-deps-v3-1-2f3ba88611ff@mailbox.org>
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260612-shadow-deps-v3-1-2f3ba88611ff@mailbox.org>

On 12-06-26, 17:51, Shuwei Wu wrote:
> K1 has two CPU cluster clocks but one shared CPU voltage rail. Use one
> cpufreq policy for all CPUs, let the OPP core handle the shared regulator
> and the cluster0 clock, and update the cluster1 clock explicitly.

If the clusters can do DVFS individually (as they have separate clocks), this
should be represented as two separate policies. Isn't it ?

-- 
viresh
