Received: from mail-yx1-f45.google.com (mail-yx1-f45.google.com [74.125.224.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8776C5632A1
	for <spacemit@lists.linux.dev>; Thu, 15 Oct 2026 17:38:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.45
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792085908; cv=pass; b=Pvrs7tW4DtZfU2PaMg115c3ujtGjcI7zvsE5INscPbJR/tbcCmI1y+mXwAgg3/QpEDIzWBoDL6fvXugsvjKG11k3czvhsZ8Exkh5EN+vEdRij0edXTFOWXz6RfM5mAGZQDd1CdYt8jX3iLDscMTnbPAf0SwMxYDzkX/bWWs3dsg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792085908; c=relaxed/simple;
	bh=bkxFv5PX8ujIxdonqIilaYDobdJDnLk8tXzGrWmcSt8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=VUTHa2VrWsq/IE1zPIWS3dH8qCT3DM8JN6nINpwx48SaroH+Yg0lk/U72BFkxNqXOMxQ3kfKkFF89mMqqP31d5JYyImK0A8VmNtdspm5fVCIVZoG6ju4PippZNyH5NsfMYl4hSG0cadFhbhoTJzTfws3c/i9BLsbNQIsVPQR4hE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ila7klLs; arc=pass smtp.client-ip=74.125.224.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ila7klLs"
Received: by mail-yx1-f45.google.com with SMTP id 956f58d0204a3-676858d42f8so4959195d50.2
        for <spacemit@lists.linux.dev>; Thu, 15 Oct 2026 10:38:18 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792085897; cv=none;
        d=google.com; s=arc-20260327;
        b=J7EsbkXgHqXftZKUTHZKAn8K8myMNHKlxE2UdCpv/TSCMPHrJm+kPyLT3r4Qojasrm
         xPX5O1MLa9HqkljhYVNsXY1BTsTauxjjNhknPGMiBfKJjBbCMcPyiKNv0vDXmSQ1QGh4
         gi5cheMMMJ6D/GMiVPimor9ZYTRbiw8hdviGQwBRRS7ArndfHLbGZg+gnCeg8fkJgR/h
         sgGZvoz0xw8f6b/dhgx+26iWZhsLtV6cjq9vJJsqn+Nyv3PXZEOKkaKktEDeuReP3LMV
         BNIdHF6hJ5GXutLs+R9xJRb1mMzy/hez5NcN9wWXCCz6o6mtRVyx1SrBWUGvR7wU1Rpb
         VzdA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=RNR7hf8UYLE+m8+IlSqf9D9Kn/JvEzNZNospuZY38uA=;
        fh=mmK//VToTNcf8zp+GUzyOcC3cXE9bJtX7aYQ9uUv2a0=;
        b=AAmCEASbFWYS02urI3CaWXkLvyTar/kBjxfsIR9jzK6PX1A6M2OggPDWBgNkv7lauk
         uanCPozRzRrh7QSlAtdSUJe0y8cNPUsBqT6hAciSr16U9UH0WvIJ8rZBSJxwp0jC/UwL
         FtNziR1+GhrMDclX6KrjdQOoxW6welkkbfNbRNgLDESpX95mp/KFOZvI3JH8zrCAc+ZL
         TYP2MW1o7Cz8iow3Es53u53AKF8ZncL6Ms7QhnuSBcOCfuWCp2JzEnrFVJWbsdJCEYxR
         S0z7U+7jiACqqW0tyv1vkV3c06CudXg9ud2IkJpoE8Sx/ZfKhk2JLA9JLDtjaZIjFFk7
         rYug==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792085897; x=1792690697; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=RNR7hf8UYLE+m8+IlSqf9D9Kn/JvEzNZNospuZY38uA=;
        b=Ila7klLsWISo+gOcydOFxcuONcjmvvw8pXrxD3bwdI9SAldca0xQfq1XPb7ad7IIpO
         egvSakZ0HX62i4oKlmhDsTnSxPOaGOIVswiG+hBhJwZ9W3Qu8QbLd3hHmdhtgmlb+bN0
         nuJ7ZKLNcS8vIs4+wVVQhT7/2QbHQMkXz4xq6W0dMCFAxeBzSmO0xogOvh2oNK1H0YIA
         Iey2Nh/5L+xK2BRTN3iLNeJYDbLxO8bUhcv6X6Nofh0pCToaK7hNnFYzxjVRyqXaeWOe
         t+kCkHpAis3daL6YR+BYcmJqGKD30DP/XKlbzUgJciFptrdlSyRW/nIne9hRnGBYwIYV
         DKdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792085897; x=1792690697;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=RNR7hf8UYLE+m8+IlSqf9D9Kn/JvEzNZNospuZY38uA=;
        b=B/XiI49y6OAswPavPMwLbxjwa7KQlJuyl03ydhHTDXZ91ofuj9DJLas8vsRoIwFcpP
         xZCnYtJpUag77Pjcsv2sdPMQUq8GidEGt6bCuIDfwfhc46y0ekTj5SetSNw58zoOCsXw
         D2w6e33CrxAdtdEorAjYxqqQIoKZXyQXLsJSBcg2Umjkjlc43DqVettUmnizyj+jBuE1
         Ai/Rx2vZpSEo/91xMpOHxwVYZaXDUggIPsXKifAqVXwGCDOeN4ZT8kMtoN6+zHnyDISF
         pC2cG48w8MpJKxzEtDhw7wUKNzTKJsY2vP+YwNpws4uHxfZDp/OnHWdXMYKPmfD7fLcf
         Rm/g==
X-Forwarded-Encrypted: i=1; AKwUvBypTQJ3Q/irRBwuJBda96HnNNb5BKfW42GLmPhQJaSpbh5lLHJPQkizC9cfeQ+TfFAi9PDPMPTeig==@lists.linux.dev
X-Gm-Message-State: AFq9FYIW6nAyO1w+GeMe+nejhVj8EuDFajgbB1wQeEEiC19lBLk0UIxk
	70wPw+MSrLrRAw6sWMXKOwEWd5wzarjgBof8BuZj8woN4OuLESpuaio/Ogq+yeqJgdC9MgmxhlW
	yj8yEawsHmMSMp5lSZmdpmFIs3EAgXj0=
X-Gm-Gg: AYBFou3QFE2jpYqmycTKy9Gb9d/YI305yjsMXtFvhakvXu86p4qWXB94IK7k2zi4Vrn
	J/gdF3+43d8w/VQQAbn1EOWH/kG7X/Kys3AoIfXUYguWJThGc7i0uuF7bssReb1itYj95Wj/flY
	1bfj7u38K0jn/kfjBZbekvhEG6F7ocYo3BA4Dy/AknUZDpf3lL0reL6jQYG93jY7XDeAXiGqIQn
	aYhheQI1hboRSCERtinVWDuI3R0SmdBCfEbtBqatmoIOLAd9roMeztArVW/XZ+LfehWeWjAqxn4
	IgX5x3rPbzXeY2zGEvpgDFkrnlRq1qLYEee3jf0T7B7xm8Aj8Fg9RliW2OsFRO0F++4=
X-Received: by 2002:a05:690e:1c07:b0:679:aa90:d272 with SMTP id
 956f58d0204a3-679aa90dd58mr432536d50.108.1792085897078; Thu, 15 Oct 2026
 10:38:17 -0700 (PDT)
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20261008-04-k3-pm-support-v2-0-6f778a53dd2d@kernel.org> <20261008-04-k3-pm-support-v2-2-6f778a53dd2d@kernel.org>
In-Reply-To: <20261008-04-k3-pm-support-v2-2-6f778a53dd2d@kernel.org>
From: Iker Pedrosa <ikerpedrosam@gmail.com>
Date: Thu, 15 Oct 2026 19:38:00 +0200
X-Gm-Features: AclHuK-mkmvLNzpAloyGNWEU1xEwlRugYfUHBOpsjJVuzj_o9PRbUr7KYWotes8
Message-ID: <CABdCQ=PAHxwH1+1OkLiW2ad+PTxNY6OmmPwOwAR3EoDe6Mt7Zg@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] pmdomain: spacemit: Add power domain driver
To: Yixun Lan <dlan@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Ulf Hansson <ulfh@kernel.org>, Paul Walmsley <pjw@kernel.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, Icenowy Zheng <uwu@icenowy.me>, devicetree@vger.kernel.org, 
	linux-riscv@lists.infradead.org, spacemit@lists.linux.dev, 
	linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

El jue, 8 oct 2026 a las 5:45, Yixun Lan (<dlan@kernel.org>) escribi=C3=B3:
>
>   SpacemiT's PMU (Power Management Unit) consist of several power domains
> which can be managed independently, depending on different application
> scenario, each domain can be powered on/off for saving power.

Tested on an OrangePi RV2 with the PowerVR GPU power domain. A few
comments below.

> +struct spacemit_pm_domain_param {
> +       int reg_pwr_ctrl;
> +       int bit_hw_mode;
> +       int bit_sleep2;
> +       int bit_sleep1;
> +       int bit_isolation;
> +       int bit_auto_pwr_on;
> +       int bit_hw_pwr_stat;
> +       int bit_pwr_stat;
> +       int use_hw;

bit_* fields hold values 0-15, u8 would be more precise than an int.
Similarly, reg_pwr_ctrl fits in u16 and use_hw could be bool.

> +static int spacemit_pd_power_on(struct generic_pm_domain *domain)
> ...
> +               dev_err(&domain->dev, "power-on domain: %d, error\n", spd=
->pm_index);

You could include the domain name failing, that would help identify
what's causing the problem. You are already including the name in the
"power-off" error message.

> +static int spacemit_pm_domain_probe(struct auxiliary_device *adev,
> +                                   const struct auxiliary_device_id *id)
> ...
> +       pmu->genpd_data.domains     =3D (struct generic_pm_domain **)pmu-=
>domains;

This cast relies on genpd being the first member of struct
spacemit_pm_domain. Reordering the struct silently breaks it. Consider
allocating a separate struct generic_pm_domain ** array and storing
&pd->genpd explicitly

Tested-by: Iker Pedrosa <ikerpedrosam@gmail.com>
