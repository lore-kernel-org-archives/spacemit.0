Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59EDE248868
	for <spacemit@lists.linux.dev>; Thu, 22 Jan 2026 18:04:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.45
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769105066; cv=pass; b=gEuGC8dzDz12hcFvthfkRRB2r5kF+Rf4DPZDj7xu2jcxy20HrMaMfpXuNv/3ndpup9fhEC7Shq7wgX1WDQk+fEl0JyiUYKiM4rDkqnRx8GtVYg+jrTWt2EkAD2uv9EahGYe39pEvcQ5g7xKEr6POWl3YCMbhVy6Isev0xTUzul0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769105066; c=relaxed/simple;
	bh=JoJqK6ZMjXBJh/XZxPRXUeBhD4yr+ijhekfGT0tzlJk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=l4NAsjzlsojq3cJOFenK7WIY3ENyVVkiPcMBa0yzpjqQP6eNLHPrqiNFVK8MIg6vUAw3/blfKxdng+xLtiG79OjqDSKHVDAAAvBvvSN8aru2S6VTbVCFCP5gnKRq13GKn6fVgZvg/Eya01Hg/EePs2ItXBH0oCsRKvOGUVOJ2Sc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=wPjExYZD; arc=pass smtp.client-ip=209.85.167.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="wPjExYZD"
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-59b679cff1fso1197576e87.0
        for <spacemit@lists.linux.dev>; Thu, 22 Jan 2026 10:04:15 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1769105054; cv=none;
        d=google.com; s=arc-20240605;
        b=JLA0rTTT3Oudj5OyRtyuLU76ImeuIwzPbIIp2SIIGakN5pj1UhWHusbwAQhjp16lbk
         QwcwnXJK6+zH9+lJnHDtdBf1cORh4/ANATl9hUqZu3uUNcY56r82Wmb/TenSbyJ1sUaC
         z0eI7M42+Ru/DBX9KKr40n8hc6rRb8SfxDZATbAzfvoSyIOxtzbnzGk0iMUi+Fd0veb1
         LzLL+TudMO3c+0lg4JYTCXeFMxfkaN2yexqoEpRPkm+vDlpx9R8HrE4JK7cwCwQQiCG3
         lclSZrLj650cbKYAOrzRysnauVqSA/3fZMZDNoBXcHtbrWDZnkqCjK7t5kUvH5hg7nHq
         Yykw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=1dAdnI02pT5EuloFaObahJw7pcpTRooaOZFcQF4dsRc=;
        fh=UY7XoApVKOtA12vs5qfFY7DxClhQCUTx+myIlnezd8A=;
        b=A3RoL+mg8NAY5EyzeDrZV0FDf5fCiAB5G9fsiCDUOesDoHuEpXiBS/qqB8CNmZ6cp0
         I8jCPrxdTDuVS1J5cim2f3vDOhvey+MokhqJbWCgbYJaUrwTb19XWgLi5Osd0eEiYWZo
         eWNkXqi5gnaiY6GCpCFOXPIPJVXOBVBSRxCVBps7enhQGopWYCJi1wSzY3msdWqkWcZt
         tTaLFkJVuanUqtI20FbFV4ZDLJzbBRO96KgT4iFjdZyLn8W8hYsi770uNmUKK3bEM8ur
         hSNsRxP/hwRF/JLRmoJeuZfRTkB8sNrkFxEieUQ2KKrf2EHDQUWpCYaL9CX8o2m1sMgz
         j7wQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1769105054; x=1769709854; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=1dAdnI02pT5EuloFaObahJw7pcpTRooaOZFcQF4dsRc=;
        b=wPjExYZDU33Ve//XqKVNgsZN0xxWR5Llq7dU7HX0zsfWcfdOsuQcqfu8+7ELZNbs1g
         rFlTyySFpYl8mZnh20GrrXXYvyY0zCiFzK8nD/1/7w8m1sTHgvJoJtC2yJzl9u1AZzfo
         2k4NvuexsAXfpxzKo1rJDlby302fkQXvuig2Hji0RNcu8Q6MI3m/5iIjAXW3H7pmHUqx
         sFp07eFjpIQQzmpm0xf+F1nWy7dxiV2Kq5daGWeI338LnQMj/99TebkGKLL/uwEOXxYP
         KuxPtnt3WFDrQ8HCJEX8pJaBR4GKlodVzxPjnjmbdazEFgmT8Rf7Lu7TlEz7U5TcSjDw
         CHSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769105054; x=1769709854;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1dAdnI02pT5EuloFaObahJw7pcpTRooaOZFcQF4dsRc=;
        b=l60HssJ97tsYTwT8cM1tegFKkKaNO6gzTgLcowPr7Xr83R3oDwnIOXn848lhgQcGRj
         EfKgFBIkGL3B1SSZZj9zpiTSL6xR6YJFTKF8AlNRmcoadVORJ42EkSNa6eV3C+mtLDpb
         6Ko+K0kgbCsmzLXvt5czFhR57IJ+uVofTnZkyP5LNNXz6Y5fpaC009uvD7JbvC2Seuh0
         PEMACs/psEN35hn7f2f8q0wB4k4qWcRltNei0mxK6i7q61odB8bAWo0KQXPs8bfh1Flf
         UQQ8PMvUKmReNj6vN+mQgSwOzawPGubzvau6M0PKCz4kVHQxj/miwQfCJLoB+aAcqpn4
         PvhQ==
X-Forwarded-Encrypted: i=1; AJvYcCWkPHaCrMGywF6Qp01Hfahbt1sOzqtpaT5KLUiWdl3qfO5KprWWqH16TgGkd2Q4Aym/6kAWHPa/NQ==@lists.linux.dev
X-Gm-Message-State: AOJu0Yy8TtTP72gKCDzzK8F65r41wSpN5JmjKCGbE0vVnj7MmO+9S1Aa
	lc7lRCc5CqoBntC0HllpX93mMELyWUrmjOJoVLAqCV03mWFRCtq9qdF8kKOsguCMOX3nWWSyi2g
	J0kIMCACYnjeI+La0ZDVeMFaE4zRvoJHVJzevwiH3VA==
X-Gm-Gg: AZuq6aLnmLtBbkAvUg++Htj/qjmqCL3olFlqpLjdovmsftypHYXPT3fFuakxQxioEic
	IXNWIdUBi3Ru63C4PbM5YV41pgFKqNTIAVjecO/1eQm3Kz4pnwCGlRGTsl719D1IsY2//G8dbeX
	kFviJPUfnhDmskR3PrLBRq8E+XHCsTuWPyej9B3UFbmaPhVFHoT6sbMzplZDAIQ9dcSS+ZmjSCN
	B7/pqapne5Yb0eEqhbmcrCDlrvKG1PkGCGQrzPB5AhyKR+EULZzrlOZpXzP52d7HRpekq6MlXPS
	6VxZSx4=
X-Received: by 2002:a05:6512:2513:b0:59d:e07e:8f38 with SMTP id
 2adb3069b0e04-59de48f58f7mr64524e87.10.1769105053659; Thu, 22 Jan 2026
 10:04:13 -0800 (PST)
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260122-07-k3-mmc-v2-0-3c3ffef25e94@kernel.org>
In-Reply-To: <20260122-07-k3-mmc-v2-0-3c3ffef25e94@kernel.org>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Thu, 22 Jan 2026 19:03:36 +0100
X-Gm-Features: AZwV_Qi_ZbdqQa48xiUnmVYX5skEPfI-gSYl1dRWblEnVxVJaaRBzgmXmm23av4
Message-ID: <CAPDyKFrXNj-FwGvCet6rw3NA8zshLAi02AGPeUQ8zLy6iQ3uiw@mail.gmail.com>
Subject: Re: [PATCH v2 0/2] mmc: spacemit: Add support for K3 SoC
To: Yixun Lan <dlan@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Adrian Hunter <adrian.hunter@intel.com>, linux-mmc@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-riscv@lists.infradead.org, 
	spacemit@lists.linux.dev, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Thu, 22 Jan 2026 at 10:38, Yixun Lan <dlan@kernel.org> wrote:
>
> Enable SDHCI controller support on new SpacemiT K3 SoC, while as before
> only the third controller and the eMMC device has been tested which using
> vendor K3 evb board. This board has not acquired support in mainline
> kernel, so I've omitted the DT part patches for now.
>
> The new SDHCI controller almost reuse the same IP as old K1 generation,
> while fixed the broken 64BIT DMA issue.
>
> Hi Ulf,
>  Any chance to queue this for v6.20? I know it's a little bit late,
> but the patch itself is quite simple and we've tested on evb board.
>
> Signed-off-by: Yixun Lan <dlan@kernel.org>
> ---
> Changes in v2:
> - collect Rob's Ack
> - drop uncessary blank line
> - drop return check from of_device_get_match_data
> - Link to v1: https://lore.kernel.org/r/20260121-07-k3-mmc-v1-0-ff77c07bfdf6@kernel.org
>
> ---
> Yixun Lan (2):
>       dt-bindings: mmc: spacemit,sdhci: add support for K3 SoC
>       mmc: sdhci-of-k1: spacemit: Add support for K3 SoC
>
>  .../devicetree/bindings/mmc/spacemit,sdhci.yaml       |  4 +++-
>  drivers/mmc/host/sdhci-of-k1.c                        | 19 +++++++++++++++++--
>  2 files changed, 20 insertions(+), 3 deletions(-)
> ---
> base-commit: 6cefff068d030786d63fa50970d6581c354630b2
> change-id: 20260112-07-k3-mmc-6ca01267e834
>
> Best regards,
> --
> Yixun Lan <dlan@kernel.org>
>

The series applied for next, thanks!

Kind regards
Uffe
