Received: from mail-qv1-f99.google.com (mail-qv1-f99.google.com [209.85.219.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C805C301493
	for <spacemit@lists.linux.dev>; Wed, 10 Sep 2025 22:05:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.99
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757541919; cv=none; b=Htcjf597PJc9kwgMf5ZC4H4TVZ8LiGBmHuwwWNjqa38Edn1hmCfoyT4DDvrAXx/K4/0RFyvGbIniJiqBoCFHQpZae3z2WVPgDxbcSLEQY4DiS4Z9g3wBYwavVzqa30HYYWQj42fsYMranCX7BHytAfn25QwkZyARyX0rwXPnGNo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757541919; c=relaxed/simple;
	bh=WPmBkbbWU0R7UVuoQr9K4F2w4LPIWw8i2zUW2ipwqcM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=NvhUrwLqXyUtHLzLP+kGSY6xDhoKm0fMTA3Ml0ta9txXyFKk3dwoC6hROgVFh7U1au/fA53Xn8PHAkQOpW0kKYwYXMkJt36DM7LzbMvT5JCyfmQhW2dd7z5pXgqRC3E/FzhG5a/pkIEdd3ErhsQxYxBHeev7OMuQC3h6nvB1Mv8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=broadcom.com; spf=fail smtp.mailfrom=broadcom.com; dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b=CJPkRN1B; arc=none smtp.client-ip=209.85.219.99
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b="CJPkRN1B"
Received: by mail-qv1-f99.google.com with SMTP id 6a1803df08f44-72226768824so532696d6.2
        for <spacemit@lists.linux.dev>; Wed, 10 Sep 2025 15:05:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757541917; x=1758146717;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:dkim-signature:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=k+pRF4YDkBDpu0q0XohqilWJxU+Cw/6tcedpHDHdQxs=;
        b=hfztBBl1lftpXFJwPHELAjrwsdoe41Kt7qcjCmrnCKX0QB4iyZT/JlKszhdaMSgucT
         XETWMM79kFCix8XL/UHI3wEqtsG5DDdWxNL3QheWpzrT6znvoqAMFdYC6WJaHphgKSBp
         RpF/s4HdA9D/xzpjMpGGaa0orOgDMk6Y6+Ci8EQUXPwaeSWBLmlVJofWeFR7MEIMMDxW
         fUPKmTFkv9I0uHTj1nNvnDGgoydP00x1EnGZK0l260JMWOTM/PNOHqLkGH+oyu85+xQr
         EOQQpY66OFhubDucacgo65/b557jiZ6DihgCEn/je0l+ZKPr0jLwJFszAsySLVZl8lQw
         PB5w==
X-Forwarded-Encrypted: i=1; AJvYcCXEGZXGaBSZU8gQ8K4Hdo7eUdyWHCU7aQ2dVcNcuXCyoLJ9lpQ0XjkEWkyyl7qoeMdU773mbaFwaw==@lists.linux.dev
X-Gm-Message-State: AOJu0YyyiisNeSlAUOIrsGUREROPGrlypIhJF/J5RJw+J8SxBD1pjTQs
	14M7VMG9taFenylp+cfA0xmqZ+LgCyssrQpE5l8E01XrVVY3eSuXm5L8junaTm35bydqCekBg2q
	fwrRFU2tb/4TFzSb4Q5FZDsDOtqXZU4F4b0jpT4Ho7J1pXIUqgIBH+D+e/Qno4r9XrEPNZyNyjE
	+iWG/eMCgXK5dNhlJOnaKAfYSu2mQVw28kNKzBqIGoALCyGAeJ+eQ8vK/4B65GQfsuG09yYMofw
	SNxSdpmcjN64kBo62k=
X-Gm-Gg: ASbGncszfp/dFME295oVSrL41XY6D+SB40UecA+OrAPfDmlIw4mv/wi5Y7fPpYLxxRA
	9NF0QngJtX4Ez7T2GD48F4tJFAjnqoTm8X/NJLynSsxOrkp4Sg0t7etKC+2cxFTILRgN9zAgW9J
	gzZQFRqA5cWoxKw9Ai2zX0VqLPsk7FS5lxZFKoJe3kfpPlQ9X02CpVw+83U8+OEGfT9MeFvrZUV
	6bXwTm6EKls9+/AgfCC/kQ17TmCKJm2TUgKMQ2ugczkmwURFbp4xdWXuaGBWOW185EAFqTIrQyY
	T/5gQxJ5RxU9/c/CmHDFqL/UbkI5ilNkt9dfFOAi6NgGsEuXwT5wjcL+viwVeYI9NTwxF/fs9Ua
	uRZs0355LPWy5yTqtfiv3XMXVtxcHId2oqo8cUshcGxTqUf1H/B89hSgc7J59Shx9+Co7oHyr3W
	pXWjO2
X-Google-Smtp-Source: AGHT+IEcnJSI7AdaqTIioJdgVoGIWZQFDDgdgzC+zOcjJF+tASdUJvKMrzslDWfBgMNf4zMuvgW9AYBtzZub
X-Received: by 2002:a05:6214:6004:b0:754:17e2:62d6 with SMTP id 6a1803df08f44-75417e26557mr110199146d6.27.1757541916604;
        Wed, 10 Sep 2025 15:05:16 -0700 (PDT)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-10.dlp.protect.broadcom.com. [144.49.247.10])
        by smtp-relay.gmail.com with ESMTPS id 6a1803df08f44-762c8f97edasm363446d6.33.2025.09.10.15.05.16
        for <spacemit@lists.linux.dev>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 10 Sep 2025 15:05:16 -0700 (PDT)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-24cba71c71fso254695ad.2
        for <spacemit@lists.linux.dev>; Wed, 10 Sep 2025 15:05:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1757541915; x=1758146715; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=k+pRF4YDkBDpu0q0XohqilWJxU+Cw/6tcedpHDHdQxs=;
        b=CJPkRN1B9HIWTJj8MFRCOVPmkFKpyWrPP/lI+K++JgM4Bgs0dGN+68fZ2zraGLIqui
         6lcZGHinI2BmMLa4pHjxMec1+rFjHsGcL2jUb7ekpF58cBK/ScJnKOjSGVX0HdEMP4xC
         QawCT5Xnwg0AyEk0wmmgWxnV4tRNa/pjMQv14=
X-Forwarded-Encrypted: i=1; AJvYcCX3VweAfeQV10eq+OKYvWzWYGTxykFexjhLOSirFuMne/+q3yDGYy5XOVkJ7HEYgTsIDKgQnjHl9g==@lists.linux.dev
X-Received: by 2002:a17:902:d58f:b0:24b:11c8:2d05 with SMTP id d9443c01a7336-251718ddafdmr259726885ad.45.1757541915362;
        Wed, 10 Sep 2025 15:05:15 -0700 (PDT)
X-Received: by 2002:a17:902:d58f:b0:24b:11c8:2d05 with SMTP id d9443c01a7336-251718ddafdmr259726435ad.45.1757541914912;
        Wed, 10 Sep 2025 15:05:14 -0700 (PDT)
Received: from [10.67.48.245] ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-25bf675b77fsm1714715ad.43.2025.09.10.15.05.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 10 Sep 2025 15:05:14 -0700 (PDT)
Message-ID: <f72733cf-cf96-4960-b07f-ed0d9efbbb03@broadcom.com>
Date: Wed, 10 Sep 2025 15:05:11 -0700
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird Beta
Subject: Re: [PATCH v2 07/15] gpio: brcmstb: use new generic GPIO chip API
To: Bartosz Golaszewski <brgl@bgdev.pl>,
 Linus Walleij <linus.walleij@linaro.org>,
 Keguang Zhang <keguang.zhang@gmail.com>, Alban Bedel <albeu@free.fr>,
 Doug Berger <opendmb@gmail.com>,
 Florian Fainelli <florian.fainelli@broadcom.com>,
 Broadcom internal kernel review list
 <bcm-kernel-feedback-list@broadcom.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Samuel Holland <samuel.holland@sifive.com>, Yixun Lan <dlan@gentoo.org>,
 Andy Shevchenko <andy@kernel.org>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-mips@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-riscv@lists.infradead.org,
 spacemit@lists.linux.dev,
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
References: <20250910-gpio-mmio-gpio-conv-part4-v2-0-f3d1a4c57124@linaro.org>
 <20250910-gpio-mmio-gpio-conv-part4-v2-7-f3d1a4c57124@linaro.org>
Content-Language: en-US, fr-FR
From: Florian Fainelli <florian.fainelli@broadcom.com>
Autocrypt: addr=florian.fainelli@broadcom.com; keydata=
 xsBNBFPAG8ABCAC3EO02urEwipgbUNJ1r6oI2Vr/+uE389lSEShN2PmL3MVnzhViSAtrYxeT
 M0Txqn1tOWoIc4QUl6Ggqf5KP6FoRkCrgMMTnUAINsINYXK+3OLe7HjP10h2jDRX4Ajs4Ghs
 JrZOBru6rH0YrgAhr6O5gG7NE1jhly+EsOa2MpwOiXO4DE/YKZGuVe6Bh87WqmILs9KvnNrQ
 PcycQnYKTVpqE95d4M824M5cuRB6D1GrYovCsjA9uxo22kPdOoQRAu5gBBn3AdtALFyQj9DQ
 KQuc39/i/Kt6XLZ/RsBc6qLs+p+JnEuPJngTSfWvzGjpx0nkwCMi4yBb+xk7Hki4kEslABEB
 AAHNMEZsb3JpYW4gRmFpbmVsbGkgPGZsb3JpYW4uZmFpbmVsbGlAYnJvYWRjb20uY29tPsLB
 IQQQAQgAywUCZWl41AUJI+Jo+hcKAAG/SMv+fS3xUQWa0NryPuoRGjsA3SAUAAAAAAAWAAFr
 ZXktdXNhZ2UtbWFza0BwZ3AuY29tjDAUgAAAAAAgAAdwcmVmZXJyZWQtZW1haWwtZW5jb2Rp
 bmdAcGdwLmNvbXBncG1pbWUICwkIBwMCAQoFF4AAAAAZGGxkYXA6Ly9rZXlzLmJyb2FkY29t
 Lm5ldAUbAwAAAAMWAgEFHgEAAAAEFQgJChYhBNXZKpfnkVze1+R8aIExtcQpvGagAAoJEIEx
 tcQpvGagWPEH/2l0DNr9QkTwJUxOoP9wgHfmVhqc0ZlDsBFv91I3BbhGKI5UATbipKNqG13Z
 TsBrJHcrnCqnTRS+8n9/myOF0ng2A4YT0EJnayzHugXm+hrkO5O9UEPJ8a+0553VqyoFhHqA
 zjxj8fUu1px5cbb4R9G4UAySqyeLLeqnYLCKb4+GklGSBGsLMYvLmIDNYlkhMdnnzsSUAS61
 WJYW6jjnzMwuKJ0ZHv7xZvSHyhIsFRiYiEs44kiYjbUUMcXor/uLEuTIazGrE3MahuGdjpT2
 IOjoMiTsbMc0yfhHp6G/2E769oDXMVxCCbMVpA+LUtVIQEA+8Zr6mX0Yk4nDS7OiBlvOwE0E
 U8AbwQEIAKxr71oqe+0+MYCc7WafWEcpQHFUwvYLcdBoOnmJPxDwDRpvU5LhqSPvk/yJdh9k
 4xUDQu3rm1qIW2I9Puk5n/Jz/lZsqGw8T13DKyu8eMcvaA/irm9lX9El27DPHy/0qsxmxVmU
 pu9y9S+BmaMb2CM9IuyxMWEl9ruWFS2jAWh/R8CrdnL6+zLk60R7XGzmSJqF09vYNlJ6Bdbs
 MWDXkYWWP5Ub1ZJGNJQ4qT7g8IN0qXxzLQsmz6tbgLMEHYBGx80bBF8AkdThd6SLhreCN7Uh
 IR/5NXGqotAZao2xlDpJLuOMQtoH9WVNuuxQQZHVd8if+yp6yRJ5DAmIUt5CCPcAEQEAAcLB
 gQQYAQIBKwUCU8AbwgUbDAAAAMBdIAQZAQgABgUCU8AbwQAKCRCTYAaomC8PVQ0VCACWk3n+
 obFABEp5Rg6Qvspi9kWXcwCcfZV41OIYWhXMoc57ssjCand5noZi8bKg0bxw4qsg+9cNgZ3P
 N/DFWcNKcAT3Z2/4fTnJqdJS//YcEhlr8uGs+ZWFcqAPbteFCM4dGDRruo69IrHfyyQGx16s
 CcFlrN8vD066RKevFepb/ml7eYEdN5SRALyEdQMKeCSf3mectdoECEqdF/MWpfWIYQ1hEfdm
 C2Kztm+h3Nkt9ZQLqc3wsPJZmbD9T0c9Rphfypgw/SfTf2/CHoYVkKqwUIzI59itl5Lze+R5
 wDByhWHx2Ud2R7SudmT9XK1e0x7W7a5z11Q6vrzuED5nQvkhAAoJEIExtcQpvGagugcIAJd5
 EYe6KM6Y6RvI6TvHp+QgbU5dxvjqSiSvam0Ms3QrLidCtantcGT2Wz/2PlbZqkoJxMQc40rb
 fXa4xQSvJYj0GWpadrDJUvUu3LEsunDCxdWrmbmwGRKqZraV2oG7YEddmDqOe0Xm/NxeSobc
 MIlnaE6V0U8f5zNHB7Y46yJjjYT/Ds1TJo3pvwevDWPvv6rdBeV07D9s43frUS6xYd1uFxHC
 7dZYWJjZmyUf5evr1W1gCgwLXG0PEi9n3qmz1lelQ8lSocmvxBKtMbX/OKhAfuP/iIwnTsww
 95A2SaPiQZA51NywV8OFgsN0ITl2PlZ4Tp9hHERDe6nQCsNI/Us=
In-Reply-To: <20250910-gpio-mmio-gpio-conv-part4-v2-7-f3d1a4c57124@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e

On 9/10/25 00:12, Bartosz Golaszewski wrote:
> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> 
> Convert the driver to using the new generic GPIO chip interfaces from
> linux/gpio/generic.h.
> 
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Reviewed-by: Florian Fainelli <florian.fainelli@broadcom.com>
Tested-by: Florian Fainelli <florian.fainelli@broadcom.com>
-- 
Florian

