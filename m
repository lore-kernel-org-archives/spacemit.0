Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89D0E472F70
	for <spacemit@lists.linux.dev>; Tue, 21 Jul 2026 17:56:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784656601; cv=none; b=FiiTukLPg28UMw4HwU4K2/AeE2eqcdVqADaF8PC0LBd6t+Xo9YxGYu/I0ogbFfaBrAMycGNyV18JS6Myuc/IZFSpfS/7byFG2lGgMegQvgRmBNzDhPdSPZo0cQJWevkOEnrtRX47v59B9y3Nno3xqbiaynQ+bMizF8DwGnL0Dbc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784656601; c=relaxed/simple;
	bh=swtbcGBx+Z+G69KWlolz+miL/y+ERWs5cFjryaMB2Uk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=uL1r0qBaDgJS7RNPK/soRPj9EcScPk8kinac+Yagtu+/2zvSvAwvirbptVID+/DCxNXmPuUHK/IdBfZw9UBWLCjNQbN6AkuGoXmViX9bU7S7kGDIi0h7MfTW4FBdEqyc0LRA8kFrj/Zq7L4YQXqmq7KQQ8TKl8sU18JQRMvn+qM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Uthg2ZaT; arc=none smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Uthg2ZaT"
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-2ceae1ed204so96912265ad.0
        for <spacemit@lists.linux.dev>; Tue, 21 Jul 2026 10:56:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784656599; x=1785261399; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=EibvRmzRwEGHkazysuYtnr7BudsAqWjL7jIqkEVJ+pw=;
        b=Uthg2ZaTGkfVQG/2xUR/Ot2xubWaR2RMrtB5QERWG4BRVtBTo3JvUXx4M0P0TSnfp7
         IZ24XaAUEwOX5w0BtwrmAJOYxUWc82hG5cdUjTb4svKzzPmb6ApkkP6IduE0NOoUMviM
         RaO5PoRDJYlilBNcyBxjCj2CBR8t23FKEQA4mFY9hryxLtIh5ZVgtg7fDRYwy02mvhSZ
         g6Ztp1DqljZTqusgPpSgrOik8BUt5SVmwm/YM/piPlxCccB6iWk0oY3epoN+Cwst7RLu
         KMPAt/s6sLoCVZzQnFblv4DQwBs4F7gMeY2NoUD1jezRIMkLNn4GO5+mdAB//7XnQ06Y
         7M6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784656599; x=1785261399;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=EibvRmzRwEGHkazysuYtnr7BudsAqWjL7jIqkEVJ+pw=;
        b=Mk4h4ItAm7uwHqtwaxcQpZgXUaU9ha4xE+6WwN4yKKoyBE62Xx3toviXwXynFL4DR4
         Ow9E1R8iMK5ntJkDXgQqI/H2xBf5XH2Uu/RtmZWujEBx3ZdDRHJ3OYzxe4a9kNiom2bt
         zYdPnKj1GMsp+0Y8xOPB6805ACudd7wFL2leCWiMR+qX49Vq735QBh1nMTnbx9i61amd
         eMRUTpjycqKuZZj8xXGk4PKgXnXmP7d7CAevRM8dBcdXeSXWE4atFVB7upl9MWeupdrK
         CQeb4WAILLjobPX2c36KFTNMmnZBtOca6R0D4q1lWPemCnkUOfWRX+liIxfb+E/+ebJ9
         AIkA==
X-Forwarded-Encrypted: i=1; AHgh+RqW18WFju5ekXIghJJgvi9ftGZ22oBFl0bq2g05sX24ZETHkGtXUhDVzn+f1D4kXSVSPX8mfZ2EZA==@lists.linux.dev
X-Gm-Message-State: AOJu0YwfJr+2hapEigDhueSlvaTiE4RrHz9Vi+gyJrnlUIm3FWKiXHlc
	MSsRrZdAfkYmJpmrwNQBApHyA0TI42AxXAqMsshkO8Sh3TPBDZ/wAmsS
X-Gm-Gg: AR+sD12tQKO69T+0+0iIuJ4NA0Jrci/9mld2vrSS2jSwVaeQD8G/7wgw/hvymfmBcZ4
	JC93mxT1BK9easHunMasCbD4sKkm+ANJLmNaNgrPB+P+eY9cgCpbPwAhM3lqg0ffv/5Iz7yxAAA
	QvBC7V3LidBlkHSaBtqrKTSKN00I2oL5GiWK0GHSBNesiP62jQeSzQpLfifs/7CkdLV29MQnqWi
	SQ7IYS7gjnDTMK9nhu+aaDceM2dcXuV1g44gFupQDGJVnXFKK6I/uzyTg+RkyvgoI6SYrixX7vr
	1El/3XdT6DxpqhVcyF+FM42Mmu8t6EhFyHg1q/DWbqM+BzQZSZfRVlXaSg6nx6zQuVfY3wrvKvM
	ZfXrkC0aIWocrug0jvu1ijqa2+EJo4sT0To/uHhmPlPYOhsDKGEcSselO9jRZP/QNA2TX4hR/Dg
	lu/Hn2EeoaRf5171KQI5tGBBy9V7h40KhfXXLiNjEa0Zg8g0rd/n7+KsayCVoaLA==
X-Received: by 2002:a17:902:d486:b0:2c8:2808:3ec9 with SMTP id d9443c01a7336-2cf3487e320mr208898165ad.12.1784656598500;
        Tue, 21 Jul 2026 10:56:38 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2cf8f362e00sm828255ad.71.2026.07.21.10.56.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 21 Jul 2026 10:56:37 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <673be23a-2a84-43b7-9be7-a661cf0e7935@roeck-us.net>
Date: Tue, 21 Jul 2026 10:56:36 -0700
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/6] dt-bindings: vendor-prefixes: Add Sensylink
To: Conor Dooley <conor@kernel.org>, Troy Mitchell <troy.mitchell@linux.dev>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Paul Walmsley <pjw@kernel.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Alexandre Ghiti <alex@ghiti.fr>, Yixun Lan <dlan@kernel.org>,
 Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-hwmon@vger.kernel.org, linux-riscv@lists.infradead.org,
 spacemit@lists.linux.dev, linux-doc@vger.kernel.org
References: <20260721-ctl2301-v2-0-ef5fb342872a@linux.dev>
 <20260721-ctl2301-v2-1-ef5fb342872a@linux.dev>
 <20260721-dill-dab-df15585090d2@spud>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 np3900V20aS7eD9K8GTU0TGC1pyz6IVJwIE=
In-Reply-To: <20260721-dill-dab-df15585090d2@spud>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 7/21/26 08:49, Conor Dooley wrote:
> On Tue, Jul 21, 2026 at 02:48:27AM -0700, Troy Mitchell wrote:
>> Add the vendor prefix for Sensylink Microelectronics.
>>
>> Signed-off-by: Troy Mitchell <troy.mitchell@linux.dev>
>> ---
>>   Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
>>   1 file changed, 2 insertions(+)
>>
>> diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Documentation/devicetree/bindings/vendor-prefixes.yaml
>> index 396044f368e7..22d0d26f1bbd 100644
>> --- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
>> +++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
>> @@ -1467,6 +1467,8 @@ patternProperties:
>>       description: Sensirion AG
>>     "^sensortek,.*":
>>       description: Sensortek Technology Corporation
>> +  "^sensylink,.*":
>> +    description: Sensylink Microelectronics Technology Co., Ltd.
> 
> Googling the company to see what their website is, I seem to see a
> different name for the company: Shanghai Sensylink Microelectronics Inc.
> Their website has that with the Shanghai dropped.
> 
> Also, probably the commit message should contain
> Link: https://en.sensylink.com/
> 

Asking Google search: "Why the two names ? Did they rename themselves at some point ?"

Response:

Understanding the Name Structure

1. English Legal Name vs. Marketing Abbreviation

Sensylink Microelectronics Technology Co., Ltd.:
This is the literal translation of their full, formal registered corporate name
used for international trade, customs, and legal documentation.

Sensylink Microelectronics Inc.:
This is a simplified, Westernized abbreviation used on their official
English website and marketing materials for cleaner global branding.

2. The Native Chinese Name

上海申矽凌微电子科技股份有限公司 (Shanghai Shenxiling Microelectronics Technology
Co., Ltd.): This is the company's sole, official legal name registered with
the Chinese government.

"Sensylink" is a portmanteau created specifically for international markets,
blending "Sensing" (their core technology) and "Link" (their interface and
connectivity products).

Prodding further, asking if the previous response was complete, it tells
me that there was a name change:

According to Chinese corporate registry data (via Tianyancha and Qcc),
they did change their official Chinese legal name:

Old Name: 上海申矽凌微电子科技有限公司 (Shanghai Sensylink Microelectronics Technology
Co., Ltd.)

New Name: 上海申矽凌微电子科技股份有限公司 (Shanghai Sensylink Microelectronics Technology
Co., Ltd. by Shares / Joint-Stock Company)

I don't know if Linux has a policy about Legal vs. Marketing names. Personally
I don't have an opinion. Your call, really.

Guenter

